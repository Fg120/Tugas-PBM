import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_bar.dart';
import 'package:flutter_application_1/page/home/_finance_section.dart';
import 'package:flutter_application_1/page/home/_menu_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MomentoAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FinanceSection(),
          SizedBox(height: 12),
          MenuSection(),
        ],
      ),
    );
  }
}
