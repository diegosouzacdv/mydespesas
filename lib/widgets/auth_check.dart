import 'package:flutter/material.dart';
import 'package:myexpenses/services/auth_service.dart';
import 'package:myexpenses/ui/pages/login/login_page.dart';
import 'package:myexpenses/ui/menu_dashboard_layout.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      print('etapa 1');
      return loading();
    } else if (auth.usuario != null) {
      print('etapa 2');
      print('usuario é diferente de null?');
      // print(auth.usuario);
      return const MenuDashboardLayout();
      //return const FingerPrintAuthenticated();
    } else {
      print('etapa 3');
      return const LoginPage();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
