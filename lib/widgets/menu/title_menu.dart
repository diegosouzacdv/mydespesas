import 'package:flutter/material.dart';

class TitleMenu extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String title;

  const TitleMenu({Key? key, required this.selectedIndex, required this.title, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: selectedIndex == index
          ? const TextStyle(
              fontSize: 30.0,
              color: Colors.redAccent,
              fontWeight: FontWeight.w900,
            )
          : const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.normal,
            ),
      duration: const Duration(milliseconds: 300),
      child: Text(title),
    );
  }
}
