import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  Future<void> setCart(List<String> cartData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('cart', cartData);
  }

  Future<List<String>?> getCart() async {
    List<String>? data = [];
    SharedPreferences shr = await SharedPreferences.getInstance();
    data = shr.getStringList(
      'cart',
    );
    return data;
  }
}
