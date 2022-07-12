import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dataBaseHandler/dbHelper.dart';
import 'package:flutter_application_1/pages/landing_page.dart';
import 'package:flutter_application_1/pages/widget/getTextFormField.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile_Page extends StatefulWidget {
  const profile_Page({Key? key}) : super(key: key);

  @override
  State<profile_Page> createState() => _profile_PageState();
}

class _profile_PageState extends State<profile_Page> {
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassWord = TextEditingController();
  final formkey = new GlobalKey<FormState>();
  // Future<SharedPreferences> pref = SharedPreferences.getInstance();
  // final DbHelper = dbhelper.instance;

  bool fetchingData = true;

  @override
  void initState() {
    super.initState();
  }

  // Future<void> getUserData() async {
  //   final SharedPreferences sp = await pref;
  //   setState(() {
  //     _conUserName.text = sp.getString("UserName")!;
  //     _conEmail.text = sp.getString("Email")!;
  //     _conPassWord.text = sp.getString("PassWord")!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'PogenZ Profile',
              style: AppStyles.h3.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              new Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      getTextFormField(
                        controller: _conUserName,
                        // labelName: userData!['UserName'],
                        icon: Icons.person,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      getTextFormField(
                        controller: _conEmail,
                        icon: Icons.email,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      getTextFormField(
                        controller: _conPassWord,
                        icon: Icons.lock,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Update',
                              style: AppStyles.h3.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          onPressed: () {},
                          // onPressed: () {
                          //   Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => landing_Page()),
                          //       (route) => false);
                          // },
                        ),
                      ),
                      Container(
                        child: TextButton(
                          child: Text(
                            'Log out',
                            style: AppStyles.h3.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => landing_Page()),
                                (route) => false);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
