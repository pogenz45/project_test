import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/horizon.dart';
import 'package:flutter_application_1/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: landing_Page(),
    );
  }
}
