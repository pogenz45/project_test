import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/channel_page.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_images.dart';
import 'package:flutter_application_1/values/app_styles.dart';

class landing_Page extends StatelessWidget {
  const landing_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Container(
            height: size.height * 2 / 3,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0)),
              child: Image.asset(
                AppImages.image0,
                width: 700,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              height: size.height * 1 / 10,
              child: Text(
                'Get all kinds of games',
                style: AppStyles.h3
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 270,
              child: Text(
                'Search, select and install any game',
                style: AppStyles.h3.copyWith(
                    fontSize: 18, color: Color.fromARGB(255, 166, 158, 158)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              child: Text(
                'of choice',
                style: AppStyles.h3.copyWith(
                    fontSize: 18, color: Color.fromARGB(255, 166, 158, 158)),
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: TextButton(
                    child: Text(
                      'Skip now',
                      style: AppStyles.h3.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 0.5)),
                        foregroundColor:
                            MaterialStateProperty.all(AppColors.purple),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: AppColors.purple)))),
                    onPressed: () {
                      print('pressed');
                    },
                  ),
                ),
                SizedBox(
                  // width: 200,
                  child: Container(
                    child: ElevatedButton(
                      child: Text(
                        'Get started',
                        style: AppStyles.h3.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 50.0)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.lightBlue),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.purple),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: AppColors.purple),
                          ))),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyChannel()),
                            (route) => false);
                        print('pressed');
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
