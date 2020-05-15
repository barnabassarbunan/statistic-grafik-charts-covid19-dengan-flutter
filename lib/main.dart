import 'package:prakerja/beranda.dart';
import 'package:prakerja/config/env.dart';
import 'package:prakerja/view/detail/detail_page.dart';
import 'view/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MainHome(),
  );
}
class MainHome extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Env.homeRoute: (BuildContext context) {
      return HomePage();
    },
    Env.detailRoute: (BuildContext context) {
      return DetailPage();
    },
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      initialRoute: Env.homeRoute,
    );
  }
}