import 'package:flutter/material.dart';

class AppBarMyExpenses extends StatelessWidget {
  final VoidCallback onMenuTap;
  final String title;

  const AppBarMyExpenses({Key? key, required this.onMenuTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
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
      ),
    );
  }
}
