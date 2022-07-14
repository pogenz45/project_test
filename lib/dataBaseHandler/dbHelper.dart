import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/UserModel.dart';
import 'package:flutter_application_1/Model/loginModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io' as io;

class Dbhelper {
  static const String DB_Name = 'DB.db';
  static final _databaseVersion = 1;
  static final table = 'tbl_user';

  static const String C_UserName = 'UserName';
  static const String C_Email = 'Email';
  static const String C_PassWord = 'PassWord';
  // dbhelper._privateConstructor();
  // static final dbhelper instance = dbhelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await initDatabase();

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    print('DB location' + path);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _OnCreate);
  }

  Future _OnCreate(Database database, int version) async {
    await database.execute(
        "CREATE TABLE $table ($C_UserName TEXT, $C_Email TEXT, $C_PassWord TEXT, PRIMARY KEY($C_UserName))");
  }

  Future<int> SaveData(UserModel user) async {
    final dbclient = await database;
    var res = await dbclient.insert(table, user.toMap());
    return res;
    // await dbclient.insert(table, user.toMap());
  }

  Future<UserModel?> GetUserLogin(UserModel user) async {
    print('Select User');
    print(user.UserName);
    print(user.PassWord);
    var dbClient = await database;
    List<Map> maps = await dbClient.query(table,
        columns: [C_UserName, C_Email, C_PassWord],
        where: "$C_UserName = ? AND $C_PassWord = ? AND $C_PassWord = ?",
        whereArgs: [user.UserName, user.PassWord, user.PassWord]);
    print(maps);
    if (maps.length > 0) {
      print("User Exist !!!");
      return user;
    } else {
      return null;
    }
  }
  // Future<UserModel?> getUserLogin(String UserName, String PassWord) async {
  //   print('Select User');
  //   print(UserName);
  //   print(PassWord);
  //   var dbClient = await database;
  //   var res = await dbClient.query(table,
  //       columns: [C_UserName, C_PassWord],
  //       where: "$C_UserName = ? AND $C_PassWord = ?",
  //       whereArgs: [UserName, PassWord]);
  //   print(res);
  //   if (res.length > 0) {
  //     print("User Exist !!!");
  //     return UserModel.fromMap(res.first);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<UserModel?> getLoginUser(String UserName, String PassWord) async {
  //   var dbClient = await database;
  //   var res = await dbClient.rawQuery(
  //       "SELECT * FROM $table WHERE $C_UserName = $UserName AND $C_PassWord = $PassWord");
  //   if (res.length > 0) {
  //     return UserModel.fromMap(res.first);
  //   }
  //   return null;
  // }

  Future<int> UpdateUser(UserModel user) async {
    var dbclient = await database;
    var res = await dbclient.update(table, user.toMap(),
        where: "$C_UserName = ?", whereArgs: [user.UserName]);
    return res;
  }

  Future<int> DeleteUser(String UserName) async {
    var dbClient = await database;
    var res = await dbClient
        .delete(table, where: '$C_UserName = ?', whereArgs: [UserName]);
    return res;
  }

  Future<List<Map<String, dynamic>>> QueryAllRows() async {
    var dbCLient = await database;
    var res = await dbCLient.query(table);
    return res;
  }
}
