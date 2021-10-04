import 'package:flutter/material.dart';
import 'package:mydespesas/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:mydespesas/widgets/page/app_bar_mydespesas.dart';

class DayTradePage extends StatelessWidget with NavigationStates {
  final VoidCallback onMenuTap;
  const DayTradePage({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.deepOrange,
        ),
        child: Column(
          children: [
            AppBarMyDespesas(onMenuTap: onMenuTap, title: "Day Trade"),
          ],
        )
    );
  }
}
