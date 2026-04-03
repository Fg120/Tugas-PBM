import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home/home.dart';
import 'package:flutter_application_1/page/cart/cart.dart';
import 'package:flutter_application_1/page/promo/promo.dart';

abstract class AppRoutes {
  static const String home = '/';
  static const String cart = '/cart';
  static const String promo = '/promo';
}

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.home: (_) => const Home(),
    AppRoutes.cart: (_) => const Cart(),
    AppRoutes.promo: (_) => const PromoPage(),
  };
}
