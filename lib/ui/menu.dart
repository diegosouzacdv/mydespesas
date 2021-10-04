import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydespesas/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:mydespesas/services/auth_service.dart';
import 'package:mydespesas/widgets/menu/title_menu.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuScaleAnimation;
  final int selectedIndex;
  final VoidCallback onMenuItemClicked;

  const Menu({
    Key? key,
    required this.slideAnimation,
    required this.menuScaleAnimation,
    required this.selectedIndex,
    required this.onMenuItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.dasboardClickEvent);
                    onMenuItemClicked();
                  },
                  child: TitleMenu(
                    selectedIndex: selectedIndex,
                    title: "DashBoard",
                    index: 0,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.despesasClickEvent);
                    onMenuItemClicked();
                  },
                  child: TitleMenu(
                    selectedIndex: selectedIndex,
                    title: "Despesas",
                    index: 1,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.cartoesClickEvent);
                    onMenuItemClicked();
                  },
                  child: TitleMenu(
                    selectedIndex: selectedIndex,
                    title: "Meus Cartões",
                    index: 2,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.investimentosClickEvent);
                    onMenuItemClicked();
                  },
                  child: TitleMenu(
                    selectedIndex: selectedIndex,
                    title: "Investimentos",
                    index: 3,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.dayTradeClickEvent);
                    onMenuItemClicked();
                  },
                  child: TitleMenu(
                    selectedIndex: selectedIndex,
                    title: "Day Trade",
                    index: 4,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    context.read<AuthService>().logout();
                  },
                  child: const Text(
                    "Sair",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
