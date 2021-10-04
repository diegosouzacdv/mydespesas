import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mydespesas/database/db_firestore.dart';
import 'package:mydespesas/models/cartao.dart';

class CartaoProvider extends ChangeNotifier {

  List<Cartao> _lista = [];

  late FirebaseFirestore db;

  CartaoProvider() {
    _startProvider();
  }
  _startProvider() async {
    await _startFirestore();
  }
  _startFirestore() {
    db = DBFirestore.get();
  }

  save(Cartao cartao) {
    //await db.collection("despesas/")
  }


}

