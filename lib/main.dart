import 'package:flutter/material.dart';
import 'package:test_proj/home_page.dart';

main(List<String> args) {
  runApp(CoolApp());
}

class CoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
