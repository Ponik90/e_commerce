import 'package:advance_exam/screen/cart/view/cart_screen.dart';
import 'package:advance_exam/screen/detail/view/detail_screen.dart';
import 'package:advance_exam/screen/home/view/home_screen.dart';
import 'package:advance_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'detail': (context) => const DetailScreen(),
  'cart': (context) => const CartScreen(),
};
