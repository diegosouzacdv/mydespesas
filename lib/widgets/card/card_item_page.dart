import 'package:flutter/material.dart';
import 'package:myexpenses/controller/offset_controller.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class CardItemPage extends StatelessWidget {
  final Color color;
  final int index;
  final String numberCard;
  final String name;
  final String imageUrl;

 // MultiTrackTween? multiTrackTween = MultiTrackTween([Track('rotate').add(const Duration(milliseconds: 300), Tween(begin: 0.0, end: -0.5))]);


  const CardItemPage({Key? key, required this.color, required this.index, required this.numberCard, required this.name, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OffsetController>(
      builder: (BuildContext context, OffsetController offsetController, Widget? child) {

        return Transform.rotate(
              angle: 0.2,
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(color: Colors.deepPurpleAccent, offset: Offset(0, 10), blurRadius: 15)],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }
}
