import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/channel1.dart';
import 'package:flutter_application_1/pages/channel_page.dart';
import 'package:flutter_application_1/pages/landing_page.dart';
import 'package:flutter_application_1/pages/widget/channel_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
