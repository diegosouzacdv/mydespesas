import 'package:flutter/material.dart';

class AppBarMyDespesas extends StatelessWidget {
  final VoidCallback onMenuTap;
  final String title;

  const AppBarMyDespesas({Key? key, required this.onMenuTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: const Icon(Icons.menu, color: Colors.white),
          onTap: onMenuTap,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        const Icon(Icons.settings, color: Colors.white),
      ],
    );
  }
}
