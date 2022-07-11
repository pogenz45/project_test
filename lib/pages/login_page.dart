import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/pages/channel_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/widget/alert.dart';
import 'package:flutter_application_1/pages/widget/getTextFormField.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import '../dataBaseHandler/DbHelper.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<loginPage> {
  final formkey = new GlobalKey<FormState>();

  final _conUserID = TextEditingController();
  final _conPassWord = TextEditingController();
  login() async {
    String UserID = _conUserID.text;
    String PassWord = _conPassWord.text;
    if (UserID.isEmpty) {
      alertDialog('Please enter UserName');
    } else if (PassWord.isEmpty) {
      alertDialog('Please enter password');
    } else {
      await dbhelper().getLoginUser(UserID, PassWord).then((UserData) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyChannel()),
            (route) => false);
      }).catchError((Error) {
        print(Error);
        alertDialog('Error: Login Fail');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: new Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new ExactAssetImage(AppImages.image0),
                    fit: BoxFit.cover),
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Hello',
                    style: AppStyles.h3.copyWith(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1.0, bottom: 60),
                    child: Text(
                      'Sign in!',
                      style: AppStyles.h3.copyWith(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                new Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 650,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        getTextFormField(
                          controller: _conUserID,
                          labelName: 'UserName',
                          hintName: 'UserName',
                          icon: Icons.person,
                          inputType: TextInputType.name,
                          isObscureText: false,
                        ),
                        getTextFormField(
                          controller: _conPassWord,
                          labelName: 'PassWord',
                          hintName: 'PassWord',
                          icon: Icons.lock,
                          isObscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12, left: 200),
                          child: TextButton(
                            child: Text(
                              'Forgot password',
                              style: AppStyles.h3.copyWith(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 2, 26, 46)),
                            ),
                            style: ButtonStyle(),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 300,
                          child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'SIGN IN',
                                style: AppStyles.h3.copyWith(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 16, 50, 105)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              )),
                            ),
                            onPressed: () {
                              login();
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 150, right: 50),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Don't have account?",
                            style: AppStyles.h3.copyWith(
                              fontSize: 18,
                              color: Color.fromARGB(255, 154, 150, 150),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 45),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              'Sign up',
                              style: AppStyles.h3.copyWith(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 20, 76, 121),
                                  fontWeight: FontWeight.w800),
                            ),
                            style: ButtonStyle(),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => registerPage()),
                                  (route) => false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
