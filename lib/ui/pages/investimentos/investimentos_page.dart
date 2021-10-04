import 'package:flutter/material.dart';
import 'package:mydespesas/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:mydespesas/widgets/page/app_bar_mydespesas.dart';

class InvestimentosPage extends StatelessWidget with NavigationStates {
  final VoidCallback onMenuTap;
  const InvestimentosPage({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.indigoAccent,
        ),
        child: Column(
          children: [
            AppBarMyDespesas(onMenuTap: onMenuTap, title: "Investimentos"),
          ],
        )
    );
  }
}
