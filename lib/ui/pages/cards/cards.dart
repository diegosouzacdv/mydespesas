import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:myexpenses/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:myexpenses/config/default.dart';
import 'package:myexpenses/controller/offset_Controller.dart';
import 'package:myexpenses/widgets/card/card_expense_list.dart';
import 'package:myexpenses/widgets/card/card_item.dart';
import 'package:myexpenses/widgets/card/card_item_page.dart';
import 'package:myexpenses/widgets/card/panel_top.dart';
import 'package:myexpenses/widgets/page/app_bar_myexpenses.dart';
import 'package:provider/provider.dart';

final detailsList = [
  {
    'title': 'Titulo 1',
    'description':
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.'
  },
  {
    'title': 'Titulo 2',
    'description':
    'Acted by the readable content of a page when looking at it It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. adable English.'
  },
  {
    'title': 'Titulo 3',
    'description':
    'Established fact that a Th It is a long established fact that a The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.'
  },
  {
    'title': 'Titulo 4',
    'description':
    'M Ipsum is that it has a more-or-l It is a long establisg Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.'
  },
  {
    'title': 'Titulo 5',
    'description':
    'EEss normal distribution of letters, as opposed to using Content here It is a long established fact that a reader will be distractedum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.'
  },
];

class Cards extends StatefulWidget with NavigationStates {
  final VoidCallback onMenuTap;

  const Cards({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int currentPage = 0;
  late PageController _pageController;
  int indexColors = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage, keepPage: false, viewportFraction: 0.9);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OffsetController(_pageController),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.only(top: 48),
          decoration: BoxDecoration(
            color: colorListCartoes[indexColors],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarMyExpenses(onMenuTap: widget.onMenuTap, title: "Cards"),
              const PanelTop(),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: PageView.builder(
                  controller: _pageController,
                  pageSnapping: true,
                  onPageChanged: _onPageChanged,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    //return CardItemPage(imageUrl: 'https://cms.santander.com.br/sites/WPS/imagem/imagem-nova-loja-cartao-unique-black/21-06-08_175059_P_unique.png', color: Colors.grey, index: index, name: "teste", numberCard: "1236256325412369");
                    return ListView(
                      children: [
                        CardItem(
                          currentPage: currentPage,
                          pageController: _pageController,
                        ),
                    CardExpenseList(
                      currentPage: currentPage,
                      pageController: _pageController,
                      detailsList: detailsList,
                    ),

                      ],
                    );

                  },
                ),
              ),

              // CardItem(
              //   currentPage: currentPage,
              //   pageController: _pageController,
              // );
              //       CardExpenseList(
              //         currentPage: currentPage,
              //         pageController: _pageController,
              //         detailsList: detailsList,
              //       ),
            ],
          )),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPage = index;
      indexColors = colorsAscendant(indexColors, colorListCartoes);
    });
  }
}
