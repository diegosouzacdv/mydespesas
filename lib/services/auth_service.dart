import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn = true;
  static final _authFinger = LocalAuthentication();

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  AuthService() {
    _isSigningIn = false;
    _authCheck();
  }

  static Future<bool> hasBiometrics() async {
    try {
      return await _authFinger.canCheckBiometrics;
    } on PlatformException catch (_) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if(!isAvailable) return false;
    try{
      return await _authFinger.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (_) {
      return false;
    }

  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak_password') {
        throw AuthException('Password is weak!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('This email is already registered');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email not found. Sign up!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Incorrect password. Try again!');
      }
    }
  }

  Future loginGoogle() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      //final googleAuth = await user.authentication;
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      //var users = await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = false;
    }
  }

  logout() async {
    await googleSignIn.disconnect();
    await _auth.signOut();
    FirebaseAuth.instance.signOut();
    _getUser();
  }
}
