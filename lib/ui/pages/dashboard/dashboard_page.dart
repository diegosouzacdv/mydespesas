import 'package:flutter/material.dart';
import 'package:mydespesas/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:mydespesas/widgets/page/app_bar_mydespesas.dart';

class DashBoardPage extends StatelessWidget with NavigationStates {
  final VoidCallback onMenuTap;

  const DashBoardPage({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.grey,
      ),
      child: Column(
        children: [
          AppBarMyDespesas(onMenuTap: onMenuTap, title: "Dashboard"),
        ],
      )
    );
  }
}

// SingleChildScrollView(
// scrollDirection: Axis.vertical,
// physics: const ClampingScrollPhysics(),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// InkWell(
// child: const Icon(Icons.menu, color: Colors.white),
// onTap: onMenuTap,
// ),
// const Text(
// 'Meus Cartões',
// style: TextStyle(fontSize: 24, color: Colors.white),
// ),
// const Icon(Icons.settings, color: Colors.white),
// ],
// ),
// const SizedBox(height: 50),
// SizedBox(
// height: 200,
// child: PageView(
// controller: PageController(viewportFraction: 0.8),
// scrollDirection: Axis.horizontal,
// pageSnapping: true,
// children: [
// Container(
// margin: const EdgeInsets.symmetric(horizontal: 8),
// color: Colors.redAccent,
// width: 100,
// ),
// Container(
// margin: const EdgeInsets.symmetric(horizontal: 8),
// color: Colors.blueAccent,
// width: 100,
// ),
// Container(
// margin: const EdgeInsets.symmetric(horizontal: 8),
// color: Colors.greenAccent,
// width: 100,
// ),
// ],
// ),
// ),
// const SizedBox(height: 20),
// const Text(
// "Transactions",
// style: TextStyle(color: Colors.white, fontSize: 20),
// ),
// const SizedBox(height: 5),
// ListView.separated(
// physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return const ListTile(
// title: Text('Macbook'),
// subtitle: Text('Apple'),
// trailing: Text('-2900'),
// );
// },
// separatorBuilder: (context, index) {
// return const Divider(height: 16);
// },
// itemCount: 10,
// ),
// const SizedBox(height: 20),
// ],
// ),
// ),
