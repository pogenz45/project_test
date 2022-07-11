class UserModel {
  String? UserName;
  String? PassWord;
  String? Email;
  // int? ID;

  UserModel(
    this.UserName,
    this.Email,
    this.PassWord,
  );

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
