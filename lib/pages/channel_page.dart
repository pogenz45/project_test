library blur_bottom_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_icons.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class MyChannel extends StatefulWidget {
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final VoidCallback? onClick;
  final double filterX;
  final double filterY;
  final double opacity;
  final Color backgroundColor;
  final BottomNavigationBarType bottomNavigationBarType;
  final int currentIndex;
  // final List<BottomNavigationBarItem> bottomNavigationBarItems;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  // final Function(int) onIndexChange;
  const MyChannel(
      {Key? key,
      this.showSelectedLabels = false,
      this.showUnselectedLabels = false,
      this.onClick,
      this.filterX = 5.0,
      this.filterY = 10.0,
      this.opacity = 0.8,
      this.backgroundColor = Colors.black,
      this.bottomNavigationBarType = BottomNavigationBarType.fixed,
      this.currentIndex = 0,
      // required this.onIndexChange,
      // required this.bottomNavigationBarItems,
      this.selectedItemColor = Colors.blue,
      this.unselectedItemColor = Colors.white})
      : super(key: key);

  @override
  State<MyChannel> createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
  final Screens = [MyChannel()];
  int? tappedIndex;
  List<Map> categories = [
    {'name': 'Action'},
    {'name': 'Adventure'},
    {'name': 'Racing'},
    {'name': 'Shooting'},
    {'name': 'Online'},
  ];
  List<Map> recommened = [
    {'imagePath': AppImages.image3},
    {'imagePath': AppImages.image2},
    {'imagePath': AppImages.image1},
  ];
  List<Map> recommened_name = [
    {'name': 'The Grandure'},
    {'name': 'The Grandure'},
    {'name': 'The Grandure'},
  ];
  List<Map> NewReleases = [
    {
      'name': 'Lorem Ipsum',
      'imagePath': AppImages.image4,
    },
    {
      'name': 'Lorem Ipsum',
      'imagePath': AppImages.image5,
    },
    {
      'name': 'Lorem Ipsum',
      'imagePath': AppImages.image6,
    },
    {
      'name': 'Lorem Ipsum',
      'imagePath': AppImages.image7,
    },
    {
      'name': 'Lorem Ipsum',
      'imagePath': AppImages.image7,
    },
    {
      'name': 'Lorem Ipsum',
      'imagePath': AppImages.image7,
    },
  ];
  List<Map> detail = [
    {
      'd':
          'Lorem ipsum dolor sit amet, consectetur adipiscing dlit,Cum nisi iaculis nunc neque enim'
    },
    {
      'd':
          'Lorem ipsum dolor sit amet, consectetur adipiscing dlit,Cum nisi iaculis nunc neque enim'
    },
    {
      'd':
          'Lorem ipsum dolor sit amet, consectetur adipiscing dlit,Cum nisi iaculis nunc neque enim'
    },
    {
      'd':
          'Lorem ipsum dolor sit amet, consectetur adipiscing dlit,Cum nisi iaculis nunc neque enim'
    },
    {
      'd':
          'Lorem ipsum dolor sit amet, consectetur adipiscing dlit,Cum nisi iaculis nunc neque enim'
    },
    {
      'd':
          'Lorem ipsum dolor sit amet, consectetur adipiscing dlit,Cum nisi iaculis nunc neque enim'
    },
  ];
  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;
  int currentIndex = 0;
  // late List<bool> pressAttentions = categories.map((e) => false).toList();
  // bool pressAttention = false;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  final TextEditingController conUserName = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUserName();
    tappedIndex = 0;
  }

  Future<void> getUserName() async {
    final SharedPreferences sp = await pref;
    setState(() {
      conUserName.text = sp.getString('UserName')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, bottom: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What would you like to play',
                  style: AppStyles.h3.copyWith(
                      fontSize: 18, color: Color.fromARGB(255, 130, 130, 132)),
                ),
              ),
            ),
            Container(
              child: SizedBox(
                width: 380,
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(225, 116, 118, 119),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Search game",
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintStyle: AppStyles.h3
                            .copyWith(fontSize: 15, color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.0),
                            borderSide: const BorderSide(
                              width: 2.0,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 10, top: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Browse Categories',
                  style: AppStyles.h3.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  height: size.height * 1 / 24,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45.0),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: const Color.fromARGB(
                                              255, 111, 107, 107))),
                                  primary: tappedIndex == index
                                      ? AppColors.purple
                                      : AppColors.primaryColor,
                                ),
                                child: Text(
                                  categories[index]['name'],
                                  style: AppStyles.h3.copyWith(
                                      fontSize: 14, color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    tappedIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommened',
                  style: AppStyles.h3.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4.0, right: 8),
              child: SingleChildScrollView(
                child: Container(
                  height: size.height * 1 / 3.5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommened.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Container(
                              decoration: BoxDecoration(
                                // color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(45.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      child: Image.asset(
                                        recommened[index]['imagePath'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 147.0),
                                    child: Container(
                                      height: 100,
                                      width: 247,
                                      child: Container(
                                        child: ClipRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 3.0, sigmaY: 3.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200
                                                      .withOpacity(0.5)),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 12.0,
                                                                  top: 12,
                                                                  bottom: 5),
                                                          child: Text(
                                                              recommened_name[
                                                                      index]
                                                                  ['name'],
                                                              style: AppStyles.h3.copyWith(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        55.0),
                                                            child: Text(
                                                              categories[index]
                                                                  ['name'],
                                                              style: AppStyles
                                                                  .h3
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 8.0,
                                                                    right: 85),
                                                            child: Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40.0,
                                                            top: 30),
                                                    child: Container(
                                                      child: ElevatedButton(
                                                        child: Text(
                                                          'Get',
                                                          style: AppStyles.h3
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20))),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(AppColors
                                                                      .purple),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'New Releases',
                      style: AppStyles.h3.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 140, right: 10, top: 15),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          'See all',
                          style: AppStyles.h3.copyWith(
                              fontSize: 20,
                              color: Color.fromARGB(255, 161, 154, 154)),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: SizedBox(
                width: 400,
                child: Container(
                  height: size.height * 1 / 1.1,
                  child: ListView.builder(
                    itemCount: NewReleases.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.all(Radius.circular(30)),
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: Colors.white,
                            //       blurRadius: 2,
                            //     ),
                            //   ],
                            // ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3.0, bottom: 20),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0)),
                                    child: Image.asset(
                                      NewReleases[index]['imagePath'],
                                      fit: BoxFit.fitHeight,
                                      width: 120,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Container(
                                        // padding: EdgeInsets.only(bottom: 95),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          NewReleases[index]['name'],
                                          style: AppStyles.h3.copyWith(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Container(
                                          child: Text(
                                            detail[index]['d'],
                                            style: AppStyles.h3.copyWith(
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 187, 183, 183)),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60.0, bottom: 70),
                                  child: Container(
                                    child: ElevatedButton(
                                      child: Text(
                                        'Play',
                                        style: AppStyles.h3.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 111, 38, 124)),
                                      ),
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {
                                        print('pressed');
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
