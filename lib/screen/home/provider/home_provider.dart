import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:advance_exam/utils/api_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  Future<List<HomeModel?>?>? model;
  String? search = "all";

  void searchData(String data) {
    search = data;
    getApiData();
  }

  void getApiData() {
    EcommerceApi helper = EcommerceApi();
    model = helper.getApi(category: search!);
    model!.then((value) {
      if (value != null) {
        notifyListeners();
      }
    });
  }
}
