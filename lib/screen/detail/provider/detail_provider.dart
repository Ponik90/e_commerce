import 'package:advance_exam/utils/shared_helper.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  SharedHelper helper = SharedHelper();
  List<String> bookMark = [];

  Future<void> setBookMark(image) async {
    List<String>? data = await helper.getCart();
    if (data != null) {
      data.add(image);
      helper.setCart(data);
    } else {
      helper.setCart([image]);
    }
    getBookmark();
    notifyListeners();
  }

  Future<void> getBookmark() async {
    var list = await helper.getCart();
    if (list != null) {
      bookMark = list;
      notifyListeners();
    }
  }
}
