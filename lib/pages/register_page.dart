import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/UserModel.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/widget/alert.dart';
import 'package:flutter_application_1/pages/widget/getTextFormField.dart';
import '../dataBaseHandler/DbHelper.dart';
import '../values/app_images.dart';
import '../values/app_styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

class registerPage extends StatefulWidget {
  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final formkey = new GlobalKey<FormState>();
  final _conUserID = TextEditingController();
  final _conUser = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPW = TextEditingController();
  final _conRPW = TextEditingController();

  bool _passwordVisible = false;
  bool _rpasswordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    _rpasswordVisible = false;
    super.initState();
    dbhelper();
  }

  signup() {
    // String userID = _conUserID.text;
    String user = _conUser.text;
    String email = _conEmail.text;
    String pw = _conPW.text;
    String rpw = _conRPW.text;
    final bool isValid = EmailValidator.validate(email);
    if (formkey.currentState!.validate()) {
      if (pw != rpw) {
        alertDialog('Password mismatch');
      } else if (isValid == false) {
        alertDialog('Invalid Email');
      } else {
        formkey.currentState!.save();
        UserModel model = UserModel(user, email, pw);
        dbhelper().saveData(model).then((userData) {
          alertDialog('Successful save');
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => loginPage()));
        }).catchError((error) {
          print(error);
          alertDialog('Error: Save data Fail');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: true,
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
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                        'Sign up!',
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
                            height: 40,
                          ),
                          // getTextFormField(
                          //   controller: _conUserID,
                          //   labelName: 'UserID',
                          //   hintName: 'UserID',
                          //   icon: Icons.person,
                          //   inputType: TextInputType.name,
                          //   isObscureText: false,
                          // ),
                          getTextFormField(
                            controller: _conUser,
                            labelName: 'Username',
                            hintName: 'Username',
                            icon: Icons.person,
                            inputType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          getTextFormField(
                            controller: _conEmail,
                            labelName: 'Email',
                            hintName: 'zxc@gmail.com',
                            icon: Icons.email,
                            inputType: TextInputType.emailAddress,
                            isObscureText: false,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 25, left: 50, right: 50),
                            child: TextFormField(
                              controller: _conPW,
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
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  errorStyle: TextStyle(color: Colors.red),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
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
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  fillColor: Colors.grey[200],
                                  filled: true),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 25, left: 50, right: 50),
                            child: TextFormField(
                              controller: _conRPW,
                              obscureText: _rpasswordVisible,

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
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  errorStyle: TextStyle(color: Colors.red),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _rpasswordVisible = !_rpasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _rpasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  labelText: 'PassWord',
                                  hintText: 'PassWord',
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  fillColor: Colors.grey[200],
                                  filled: true),
                            ),
                          ),
                          // getTextFormField(
                          //   controller: _conPW,
                          //   labelName: 'Password',
                          //   hintName: 'Password',
                          //   icon: Icons.lock,
                          //   icon1: ,
                          //   // inputType: TextInputType.visiblePassword,
                          //   isObscureText: true,
                          // ),

                          // getTextFormField(
                          //   controller: _conRPW,
                          //   labelName: 'Confirm Password',
                          //   hintName: 'Confirm Password',
                          //   icon: Icons.lock,
                          //   // inputType: TextInputType.visiblePassword,
                          //   isObscureText: true,
                          // ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 300,
                            child: ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'SIGN UP',
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
                                signup();
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 50, right: 50),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Have account?",
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
                                'Sign in',
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
                                        builder: (context) => loginPage()),
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
            ),
          ],
        ),
      ),
    );
  }
}
