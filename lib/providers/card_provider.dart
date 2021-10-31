import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myexpenses/database/db_firestore.dart';

class CardProvider extends ChangeNotifier {

  List<Card> _list = [];

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

  save(Card card) {
    //await db.collection("expenses/")
  }


}

