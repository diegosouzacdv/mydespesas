import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/services/auth_service.dart';
import 'package:myexpenses/ui/menu_dashboard_layout.dart';
import 'package:myexpenses/widgets/login/google_signup_button_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo = '';
  late String actionButton = '';
  late String toggleButton = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
        titulo = '';
        actionButton = 'Login';
        toggleButton = "Don't have an account? Register now.";
      } else {
        titulo = 'Create your account';
        actionButton = 'Register';
        toggleButton = 'Already have an account?';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().register(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "My Expenses",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the email correctly!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: TextFormField(
                      controller: senha,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Inform your password!';
                        } else if (value.length < 6) {
                          return 'Your password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            registrar();
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (loading)
                            ? [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ]
                            : [
                                const Icon(Icons.check),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    actionButton,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton),
                  ),
                  StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      final provider = Provider.of<AuthService>(context);
                      if (provider.isSigningIn) {
                        return buildLoading();
                      } else if (snapshot.hasData) {
                        return const MenuDashboardLayout();
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const GoogleSignupButtonWidget(),
                ],
              )),
        ),
      ),
    );
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());
}
