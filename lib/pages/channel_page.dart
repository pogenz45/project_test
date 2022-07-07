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
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Container(
              child: Text(
                'What would you like to play',
                style: AppStyles.h3.copyWith(
                    fontSize: 18, color: Color.fromARGB(255, 188, 179, 179)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
