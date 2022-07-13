class UserModel {
  late String UserName;
  late String PassWord;
  late String Email;

  UserModel(
    this.UserName,
    this.Email,
    this.PassWord,
  );
  // UserModelLogin(
  //   this.UserName,
  //   this.PassWord,
  // )

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'UserName': UserName,
      'Email': Email,
      'PassWord': PassWord,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    UserName = map['UserName'];
    Email = map['Email'];
    PassWord = map['PassWord'];
  }
}
