import 'package:flutter/material.dart';

class CardExpenseList extends StatefulWidget {
  final int currentPage;
  final PageController pageController;
  final List<Map<String, String>> detailsList;

  const CardExpenseList({
    required this.currentPage,
    required this.pageController,
    required this.detailsList,
    Key? key,
  }) : super(key: key);

  @override
  _CardExpenseListState createState() => _CardExpenseListState();
}

class _CardExpenseListState extends State<CardExpenseList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.5;
    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (context, child) {
        double value = 1;
        if (widget.pageController.position.haveDimensions) {
          value = widget.pageController.page! - widget.currentPage;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }
        return Transform.translate(
          offset: Offset(0, 100 + (-value * 100)),
          child: Opacity(
            opacity: value,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.detailsList[widget.currentPage]['title']!,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.detailsList[widget.currentPage]['description']!,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: 80.0,
                    height: 5.0,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.detailsList[widget.currentPage]['title']!,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
