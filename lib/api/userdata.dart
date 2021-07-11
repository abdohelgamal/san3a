import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {
  int id;
  String fname;
  String uname;
  String email;
  String lname;
  String image;
  String token;

  User({this.token,this.id,this.uname,this.email,this.fname,this.lname,this.image,});

  String toJson() {
    Map user = Map();
    user['id'] = id;
    user['fname'] = fname;
    user['uname'] = uname;
    user['email'] = email;
    user['lname'] = lname;
    user['image'] = image;
    user['token'] = token;
    return jsonEncode(user);
  }
}

class UserProvider with ChangeNotifier {
  User _user;
  User get user => _user;
  set user(User user) {
    this._user = user;
    notifyListeners();
    final cache = FlutterSecureStorage();
    if (user == null) {
      cache.delete(key: 'user').then((_) => null);
    } else {
      cache.write(key: 'user', value: user.toJson()).then((_) => null);
    }
  }
}
