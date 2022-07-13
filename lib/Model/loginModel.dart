class LoginModel {
  late String UserName;
  late String PassWord;
  late String Email;

  LoginModel(
    this.UserName,
    this.PassWord,
  );
  // LoginModelLogin(
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

  LoginModel.fromMap(Map<String, dynamic> map) {
    UserName = map['UserName'];
    Email = map['Email'];
    PassWord = map['PassWord'];
  }
}
