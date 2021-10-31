import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final int currentPage;
  final PageController pageController;

  const CardItem({Key? key, this.currentPage = 0, required this.pageController}) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {

  double horizontalDrag = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (horizontal) {
        setState(() {
          horizontalDrag += horizontal.delta.dx;
          horizontalDrag %= 360;
        });
      },
      child: Transform(
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(pi / 180 * horizontalDrag),
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12, left: 12),
            child: Container(
              width: 500,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Color(0xff323232), Color(0xff000000)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: horizontalDrag <= 90 || horizontalDrag >= 270 ? cardFront() : cardBack(),
            ),
          ),
      ),
    );
  }
}

Widget cardFront() {
  return Container(
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'PuzzleBank',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Text(
              '|',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 10,
                fontSize: 10,
              ),
            ),
            Text(
              'Universal Bank',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/images/chip.png',
          height: 25,
        ),
        const SizedBox(height: 10),
        const Text(
          '1324 5678 9101 1121',
          style: TextStyle(color: Colors.grey, fontSize: 18, wordSpacing: 15, shadows: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.black,
              offset: Offset(2, 2),
            )
          ]),
        ),
        const SizedBox(height: 10),
        const Text(
          '05 / 20',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );

}

Widget cardBack() {
  return Container(
    padding: const EdgeInsets.only(top: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          color: Colors.grey[700],
        ),
        const SizedBox(height: 10),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(pi * 1),
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '132',
              style: TextStyle(color: Colors.grey, fontSize: 18, wordSpacing: 15, shadows: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.black,
                  offset: Offset(2, 2),
                )
              ]),
            ),
          ),
        ),
      ],
    ),
  );
}
