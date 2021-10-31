import 'package:flutter/material.dart';
import 'package:myexpenses/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:myexpenses/widgets/page/app_bar_myexpenses.dart';

class InvestmentsPage extends StatelessWidget with NavigationStates {
  final VoidCallback onMenuTap;
  const InvestmentsPage({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        decoration: const BoxDecoration(
          color: Colors.indigoAccent,
        ),
        child: Column(
          children: [
            AppBarMyExpenses(onMenuTap: onMenuTap, title: "Investments"),
          ],
        )
    );
  }
}
