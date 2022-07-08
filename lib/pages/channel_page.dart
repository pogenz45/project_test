import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_icons.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';

class MyChannel extends StatefulWidget {
  const MyChannel({Key? key}) : super(key: key);

  @override
  State<MyChannel> createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
  List<Map> categories = [
    {'name': 'Action'},
    {'name': 'Adventure'},
    {'name': 'Racing'},
    {'name': 'Shooting'},
    {'name': 'Online'},
  ];
  List<Map> recommened = [
    {'iconPath': AppImages.image3},
    {'iconPath': AppImages.image2},
    {'iconPath': AppImages.image1},
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 24, left: 12),
          child: Text(
            'Hi PogenZ Channel',
            style: AppStyles.h3.copyWith(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              child: Icon(
                Icons.notifications,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, bottom: 30),
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
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(225, 116, 118, 119),
                    suffixIcon: Container(
                      // alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    hintText: "Search game",
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
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 10, top: 25),
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
                      return Card(
                        color: AppColors.primaryColor,
                        child: ListTile(
                          title: Text(
                            categories[index]['name'],
                            style: AppStyles.h3
                                .copyWith(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        // child: SizedBox(
                        //   width: 150,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 20),
                        //     child: Container(
                        //       height: size.height * 1 / 25,
                        //       decoration: BoxDecoration(
                        //           color: AppColors.primaryColor,
                        //           borderRadius: BorderRadius.circular(45.0),
                        //           border: Border.all(
                        //               width: 1.5,
                        //               color:
                        //                   Color.fromARGB(255, 130, 130, 132))),
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(top: 4.0),
                        //         child: Text(
                        //           categories[index]['name'],
                        //           style: AppStyles.h3.copyWith(
                        //               fontSize: 14, color: Colors.white),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 10, top: 25),
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
            padding: const EdgeInsets.all(8.0),
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
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              child: Image.asset(
                                recommened[index]['iconPath'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
