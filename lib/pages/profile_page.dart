import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/UserModel.dart';
import 'package:flutter_application_1/dataBaseHandler/dbHelper.dart';
import 'package:flutter_application_1/pages/landing_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/widget/alert.dart';
import 'package:flutter_application_1/pages/widget/getTextFormField.dart';
import 'package:flutter_application_1/values/app_colors.dart';
import 'package:flutter_application_1/values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassWord = TextEditingController();
  final formkey = new GlobalKey<FormState>();
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  Dbhelper? DbHelper;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await pref;
    setState(() {
      _conUserName.text = sp.getString("UserName")!;
      print(_conUserName.text);
      _conEmail.text = sp.getString("Email")!;
      _conPassWord.text = sp.getString("PassWord")!;
    });
  }

  deleteAlert() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Are you sure to close account?'),
            actions: <Widget>[
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Delete();
                  },
                  child: Text("Yes"),
                ),
              )
            ],
          );
        });
  }

  update() async {
    String uUserName = _conUserName.text;
    String uEmail = _conEmail.text;
    String uPassWord = _conPassWord.text;
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      UserModel user = UserModel(uUserName, uEmail, uPassWord);
      await Dbhelper().UpdateUser(user).then((userData) {
        // if (userData == 1) {
        print(uUserName);
        alertDialog('Successfull updated');
        // updateSP(user, true).whenComplete(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
        // });
        // } else {
        //   alertDialog("Error: Error update");
        // }
      }).catchError((error) {
        print(error);
        alertDialog("Error");
      });
    }
  }

  Future Delete() async {
    String delUserName = _conUserName.text;

    await Dbhelper().DeleteUser(delUserName).then((value) {
      alertDialog("Successfully Deleted");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LandingPage()),
          (route) => false);

      // updateSP(null, false).whenComplete(() {});
    });
  }

  Future updateSP(UserModel user, bool add) async {
    final SharedPreferences sp = await pref;
    if (add) {
      sp.setString("UserName", user.UserName);
      sp.setString("Email", user.Email);
      sp.setString("PassWord", user.PassWord);
    } else {
      sp.remove('ID');
      sp.remove("UserName");
      sp.remove("Email");
      sp.remove("PassWord");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryColor,
        // appBar: AppBar(
        //   backgroundColor: AppColors.primaryColor,
        //   title: Padding(
        //     padding: const EdgeInsets.only(top: 20, left: 20),
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           height: 15,
        //         ),
        //         Row(
        //           children: [
        //             Text(
        //               _conUserName.text,
        //               style: AppStyles.h3.copyWith(
        //                   fontSize: 30,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white),
        //             ),
        //             SizedBox(
        //               width: 6,
        //             ),
        //             Text(
        //               'Profile',
        //               style: AppStyles.h3.copyWith(
        //                   fontSize: 30,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
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

                        SizedBox(
                          width: 330,
                          height: 48,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey[600],
                                    size: 26,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                    child: Text(
                                  _conUserName.text,
                                  style: AppStyles.h3.copyWith(fontSize: 16),
                                )),
                              ],
                            ),
                          ),
                        ),
                        // GetTextFormField(
                        //   controller: _conUserName,
                        //   // labelName: userData!['UserName'],
                        //   icon: Icons.person,
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        GetTextFormField(
                          controller: _conEmail,
                          // labelName: userData!['Email'],
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GetTextFormField(
                          controller: _conPassWord,
                          // labelName: userData!['PassWord'],
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
                            onPressed: () {
                              update();
                            },
                            // onPressed: () {
                            //   Navigator.pushAndRemoveUntil(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => LandingPage()),
                            //       (route) => false);
                            // },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(right: 25),
                          child: TextButton(
                            child: Text(
                              'Delete Account',
                              style: AppStyles.h3.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              deleteAlert();
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(right: 25),
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
                                      builder: (context) => LandingPage()),
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
          ),
        ));
  }

  // void _query() async {
  //   final allRows = await dbhelper().queryAllRows();
  //   print('query all row');
  //   allRows.forEach((row) {
  //     setState(() {
  //       userData = allRows[0];
  //       fetchingData = false;
  //     });
  //   });
  // }
}
