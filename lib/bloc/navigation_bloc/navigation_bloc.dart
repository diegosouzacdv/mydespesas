import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:mydespesas/ui/pages/cartoes/cartoes.dart';
import 'package:mydespesas/ui/pages/dashboard/dashboard_page.dart';
import 'package:mydespesas/ui/pages/daytrade/daytrade_page.dart';
import 'package:mydespesas/ui/pages/despesas/despesas_page.dart';
import 'package:mydespesas/ui/pages/investimentos/investimentos_page.dart';

enum NavigationEvents {
  dasboardClickEvent,
  despesasClickEvent,
  cartoesClickEvent,
  investimentosClickEvent,
  dayTradeClickEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final VoidCallback onMenuTap;

  NavigationBloc({required this.onMenuTap}) : super(DashBoardPage(onMenuTap: onMenuTap));

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.dasboardClickEvent:
        yield DashBoardPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.despesasClickEvent:
        yield DespesasPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.cartoesClickEvent:
        yield Cartoes(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.investimentosClickEvent:
        yield InvestimentosPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.dayTradeClickEvent:
        yield DayTradePage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}
