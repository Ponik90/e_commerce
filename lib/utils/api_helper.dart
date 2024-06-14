import 'dart:convert';

import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class EcommerceApi {
  Future<List<HomeModel?>?> getApi({required String category}) async {
    String link = "https://fakestoreapi.com/products?_gl=1*1sj5k84*_ga*MTQ4NDAxNDk1Mi4xNzA3OTc1Mzg0*_ga_ZCYG64C7PL*MTcxODM0MDA1NS43LjEuMTcxODM0MDQwMC4wLjAuMA..";
    var response = await http.get(
      Uri.parse(link),
    );
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<HomeModel?> model =
          json.map((e) => HomeModel.mapToModel(e)).toList();
      return model;
    }
    return null;
  }
}
