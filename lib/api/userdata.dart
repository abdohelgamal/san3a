import 'package:flutter/foundation.dart';

class User {
  String token;
  int id;
  String uname;
  String email;
  String fname;
  String lname;
  String image;

  User({
    this.token,
    this.id,
    this.uname,
    this.email,
    this.fname,
    this.lname,
    this.image,
  });
}

class UserProvider with ChangeNotifier {
  User _user;
  User get user => _user;
  set user(User user) {
    // TODO: cache new user or remove old one based on value.
    this._user = user;
    notifyListeners();
  }
}
