import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Momento',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE53935),
        ).copyWith(primary: const Color(0xFFE53935)),
      ),
      initialRoute: AppRoutes.home,
      routes: AppPages.routes,
    );
  }
}
