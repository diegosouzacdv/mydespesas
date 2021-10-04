import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFF4A4A58);

class Dashboard extends StatelessWidget {
  final bool isCollapsed;
  final double screenWidth;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final VoidCallback onMenuTap;
  final Widget child;

  const Dashboard({
    Key? key,
    required this.duration,
    required this.scaleAnimation,
    required this.onMenuTap,
    required this.screenWidth,
    required this.isCollapsed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          child: child,
        ),
      ),
    );
  }
}
