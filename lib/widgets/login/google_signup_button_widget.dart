import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mydespesas/services/auth_service.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  const GoogleSignupButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: OutlineButton.icon(
        onPressed: () {
          context.read<AuthService>().loginGoogle();
        },
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        highlightedBorderColor: Colors.black,
        borderSide: const BorderSide(color: Colors.black),
        textColor: Colors.black,
        icon: const FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red,
        ),
        label: const Text(
          'Entrar com o Google',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
