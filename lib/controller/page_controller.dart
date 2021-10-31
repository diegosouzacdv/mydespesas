import 'package:flutter/material.dart';

class PageControlled extends ChangeNotifier {
  var _index = 0;
  int get index => _index;

  PageControlled(PageControlled pageControlled) {
    pageControlled.addListener(() {
      _index = pageControlled._index;
      notifyListeners();
    });
  }
}