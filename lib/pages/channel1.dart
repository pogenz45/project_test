library blur_bottom_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/channel_page.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_icons.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'dart:ui';

class MyWidget1 extends StatefulWidget {
  @override
  State<MyWidget1> createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> {
  int currentIndex = 0;
  final Screens = [
    MyChannel(),
    Container(
      child: Text(
        '2',
        style: AppStyles.h3.copyWith(fontSize: 30, color: Colors.black),
      ),
    ),
    profile_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Screens[currentIndex],
      bottomNavigationBar: Container(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(255, 150, 156, 171).withOpacity(0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
            child: Container(
              height: size.height * 1 / 11,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 10,
                    ),
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Color.fromARGB(255, 172, 182, 187),
                      iconSize: 30,
                      selectedFontSize: 18,
                      unselectedFontSize: 15,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.explore), label: 'Explore'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: 'Profile'),
                      ],
                      currentIndex: currentIndex,
                      onTap: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
