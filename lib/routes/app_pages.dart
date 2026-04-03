import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home/home.dart';
import 'package:flutter_application_1/page/cart/cart.dart';

abstract class AppRoutes {
  static const String home = '/';
  static const String cart = '/cart';
}

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.home: (_) => const Home(),
    AppRoutes.cart: (_) => const Cart(),
  };
}
