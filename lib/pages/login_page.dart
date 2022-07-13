import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/Model/UserModel.dart';
import 'package:flutter_application_1/dataBaseHandler/dbHelper.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/channel1.dart';
import 'package:flutter_application_1/pages/channel_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/widget/alert.dart';
import 'package:flutter_application_1/pages/widget/getTextFormField.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<loginPage> {
  final formkey = new GlobalKey<FormState>();

  final conUserName = TextEditingController();
  final conEmail = TextEditingController();
  final conPassWord = TextEditingController();
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  var dbHelper;
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    dbHelper = dbhelper();
    super.initState();
  }

  login() async {
    String UserName1 = conUserName.text;
    String Email = conEmail.text;
    String PassWord = conPassWord.text;
    if (UserName1.isEmpty) {
      alertDialog('Please enter UserName');
    } else if (PassWord.isEmpty) {
      alertDialog('Please enter password');
    } else {
      // await dbhelper().getLoginUser(UserName, PassWord).then((UserData) {
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => profile_Page()),
      //       (route) => false);
      // }).catchError((Error) {
      //   print(Error);
      //   alertDialog('Error: Login Fail');
      // });
      UserModel user = UserModel(UserName1, Email, PassWord);
      await dbhelper().getUserLogin(user).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            print(UserName1);
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(builder: (context) => MyWidget1()),
                (route) => false);
          });
        } else {
          alertDialog("Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog('Error: Login Fail');
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await pref;
    sp.setString("UserName", user.UserName);
    sp.setString("Email", user.Email);
    sp.setString("PassWord", user.PassWord);
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
                  padding: const EdgeInsets.only(top: 15),
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
                          controller: conUserName,
                          labelName: 'UserName',
                          hintName: 'UserName',
                          icon: Icons.person,
                          isObscureText: false,
                        ),
                        getTextFormField(
                          controller: conEmail,
                          labelName: 'Email',
                          hintName: 'Email',
                          icon: Icons.person,
                          isObscureText: false,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 25, left: 50, right: 50),
                          child: TextFormField(
                            controller: conPassWord,
                            obscureText: !_passwordVisible,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter PassWord';
                              }
                              return null;
                            },
                            // onSaved: (value) {
                            //   this.controller?.text = value;
                            // },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(color: Colors.blue)),
                                errorStyle: TextStyle(color: Colors.red),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(color: Colors.red)),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                labelText: 'PassWord',
                                hintText: 'PassWord',
                                contentPadding: const EdgeInsets.only(left: 20),
                                fillColor: Colors.grey[200],
                                filled: true),
                          ),
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
                              // _query();
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 50, right: 50),
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

  void _query() async {
    final allRows = await dbhelper().queryAllRows();
    print('query all row');
    allRows.forEach((row) {
      print(row);
      return null;
    });
  }
}
