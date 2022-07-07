import 'package:flutter/material.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_icons.dart';
import 'package:flutter_application_1/values/app_styles.dart';

class MyChannel extends StatefulWidget {
  const MyChannel({Key? key}) : super(key: key);

  @override
  State<MyChannel> createState() => _MyChannelState();
}

class _MyChannelState extends State<MyChannel> {
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
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
