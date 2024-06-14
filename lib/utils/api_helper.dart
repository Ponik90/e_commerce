import 'dart:convert';

import 'package:http/http.dart'as http;
class EcommerceApi
{
  Future<void> getApi()
  async {
      String link = "shared_preferences: ^2.2.3";
      var response = await http.get(Uri.parse(link),);
      if(response.statusCode==200)
        {
          var json = jsonDecode(response.body);
        }
  }
}