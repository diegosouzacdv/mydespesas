import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:myexpenses/ui/pages/cards/cards.dart';
import 'package:myexpenses/ui/pages/dashboard/dashboard_page.dart';
import 'package:myexpenses/ui/pages/daytrade/daytrade_page.dart';
import 'package:myexpenses/ui/pages/expenses/expenses_page.dart';
import 'package:myexpenses/ui/pages/investments/investments_page.dart';

enum NavigationEvents {
  dasboardClickEvent,
  expensesClickEvent,
  cardsClickEvent,
  investmentsClickEvent,
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
      case NavigationEvents.expensesClickEvent:
        yield ExpensesPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.cardsClickEvent:
        yield Cards(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.investmentsClickEvent:
        yield InvestmentsPage(
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
