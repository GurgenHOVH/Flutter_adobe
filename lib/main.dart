import 'package:flutter/material.dart';
import 'package:test_proj/home.dart';
import 'package:test_proj/login_page.dart';

main(List<String> args) {
  runApp(CoolApp());
}

class CoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage()
      },
      theme: Theme.of(context).copyWith(
        primaryColor: Color(0xffE8AE52),
      ),
    );
  }
}
