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
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (context, child) {
        double value = 1;
        if (widget.pageController.position.haveDimensions) {
          value = widget.pageController.page! - widget.currentPage;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: child,
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: child,
          );
        }
      },
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
          child: cardFront(),
        ),
      ),

      // Container(
      //   margin: const EdgeInsets.only(left: 20),
      //   decoration: BoxDecoration(
      //     boxShadow: const [BoxShadow(color: Colors.deepPurpleAccent, offset: Offset(0, 10), blurRadius: 15)],
      //     borderRadius: BorderRadius.circular(20),
      //     color: Colors.white,
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child: RotatedBox(
      //       quarterTurns: 4,
      //       child: Image.network(
      //
      //         'https://cms.santander.com.br/sites/WPS/imagem/imagem-nova-loja-cartao-unique-black/21-06-08_175059_P_unique.png',
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      // ),
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
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          'assets/images/chip.png',
          height: 25,
        ),
        SizedBox(
          height: 10,
        ),
        
      ],
    ),
  );

}
