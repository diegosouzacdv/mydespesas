import 'package:flutter/material.dart';
import 'package:myexpenses/services/auth_service.dart';
import 'package:myexpenses/ui/pages/login/login_page.dart';
import 'package:myexpenses/ui/menu_dashboard_layout.dart';

class FingerPrintAuthenticated extends StatelessWidget {
  const FingerPrintAuthenticated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.authenticate(),
      builder: (ctx, snapshot) {
        print('print do data');
        print(snapshot.data);
        if (snapshot.data != null && snapshot.data == true) {
          print('if snapshot.hasData');
          print(snapshot.hasData);
          return const MenuDashboardLayout();
        } else {
          print('else snapshot.hasData');
          print(snapshot.hasData);
          return const LoginPage();
        }
      },
    );
  }
}
