import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io' as io;

class dbhelper {
  static const String DB_Name = 'test.db';
  static final _databaseVersion = 1;
  static final table = 'user';

  static const String C_UserName = 'UserName';
  static const String C_Email = 'Email';
  static const String C_PassWord = 'PassWord';
  static const int C_ID = 1;

  static Database? _database;
  Future<Database> get database async => _database ??= await initDatabase();

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database database, int version) async {
    await database.execute(
        "CREATE TABLE $table ($C_UserName INTEGER PRIMARY KEY, $C_Email TEXT, $C_PassWord)");
  }

  Future<int> saveData(UserModel user) async {
    final dbclient = await database;
    var res = await dbclient.insert(table, user.toMap());
    return res;
    // await dbclient.insert(table, user.toMap());
  }

  Future<UserModel?> getLoginUser(String UserName, String PassWord) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM $table WHERE $C_UserName = $UserName AND $C_PassWord = $PassWord");
    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }
    return null;
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
// }
