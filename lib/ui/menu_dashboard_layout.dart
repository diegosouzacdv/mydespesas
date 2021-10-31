import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexpenses/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:myexpenses/ui/pages/dashboard/dashboard.dart';
import 'package:myexpenses/ui/menu.dart';
import 'package:myexpenses/ui/pages/expenses/expenses_page.dart';
import 'package:myexpenses/ui/pages/dashboard/dashboard_page.dart';
import 'package:myexpenses/ui/pages/cards/cards.dart';

const Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardLayout extends StatefulWidget {
  const MenuDashboardLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuDashboardLayout> createState() => _MenuDashboardLayoutState();
}

class _MenuDashboardLayoutState extends State<MenuDashboardLayout> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween(begin: 0.5, end: 1.0).animate(_controller);
    _slideAnimation = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onMenuTap() {
    setState(() {
      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      isCollapsed = !isCollapsed;
    });
  }

  void onMenuItemClicked() {
    setState(() {
      _controller.reverse();
    });
    isCollapsed = !isCollapsed;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(onMenuTap: onMenuTap),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, NavigationStates navigationStates) {
                return Menu(
                  slideAnimation: _slideAnimation,
                  menuScaleAnimation: _menuScaleAnimation,
                  selectedIndex: findSelectedIndex(navigationStates),
                  onMenuItemClicked: onMenuItemClicked
                );
              },
            ),
            Dashboard(
                duration: duration,
                onMenuTap: onMenuTap,
                scaleAnimation: _scaleAnimation,
                isCollapsed: isCollapsed,
                screenWidth: screenWidth,
                child: BlocBuilder<NavigationBloc, NavigationStates>(builder: (context, NavigationStates navigationState) {
                  return navigationState as Widget;
                })),
          ],
        ),
      ),
    );
  }

  int findSelectedIndex(NavigationStates navigationStates) {
    if (navigationStates is DashBoardPage) {
      return 0;
    } else if (navigationStates is ExpensesPage) {
      return 1;
    } else if (navigationStates is Cards) {
      return 2;
    } else {
      return 0;
    }
  }
}
