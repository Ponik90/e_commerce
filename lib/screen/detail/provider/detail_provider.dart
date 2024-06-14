import 'package:advance_exam/utils/shared_helper.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier
{
  SharedHelper helper = SharedHelper();
  List<String> bookMark = [];

  Future<void> setBookMark()
  async {
    List<String>? data =await helper.getCart();
    if(data != null)
      {
        //data.add();
      }
  }
}