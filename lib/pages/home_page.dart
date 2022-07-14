import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(AppImages.image0),
                fit: BoxFit.cover,
              ),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Center(
                    child: Text(
                      'NFT Mobile App',
                      style: AppStyles.h3.copyWith(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 214, 211, 225),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0, bottom: 51),
                  child: Center(
                    child: Text(
                      'Welcome',
                      style: AppStyles.h3.copyWith(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 211, 208, 221),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: ElevatedButton(
                      child: Text(
                        'SIGN IN',
                        style: AppStyles.h3.copyWith(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ButtonStyle(
                        // padding: MaterialStateProperty.all(const EdgeInsets.all(1)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(45),
                        )),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                        print('pressed');
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 35),
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: ElevatedButton(
                      child: Text(
                        'SIGN UP',
                        style: AppStyles.h3.copyWith(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ButtonStyle(
                        // padding: MaterialStateProperty.all(const EdgeInsets.all(1)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        )),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                            (route) => false);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    'Login with Social Media',
                    style: AppStyles.h3.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 130),
                      child: IconButton(
                        icon: Icon(Icons.facebook),
                        color: Colors.white,
                        iconSize: 40,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.twitter),
                        color: Colors.white,
                        iconSize: 40,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.instagram),
                        color: Colors.white,
                        iconSize: 40,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
