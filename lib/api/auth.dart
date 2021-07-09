import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:san3a/api/res.dart';

class AuthApi {
  static String token = '';
  static get _headers => {"Authorization": 'Token $token'};

  static Uri _api({String url = '/'}) {
    return Uri.parse('http://20.37.244.156$url');
  }

  static getuserdata() {
    return http.get(
      _api(url: '/api/users/me/'),
      headers: _headers,
    );
  }

  static Future<Res> passwordReset(String email) {
    return http.post(
      _api(url: '/api/rest-auth/password/reset/'),
      body: {'email': email},
    ).then((res) {
      var body = jsonDecode(res.body);
      if (res.statusCode < 300) {
        return Res(success: true, message: body['detail']);
      }
      return Res(success: false, message: body['email'][0]);
    }).catchError((err) {
      print(err);
    });
  }

  static Future<Res> login(String username, String password) {
    return http.post(_api(url: '/auth-token/'),
        body: {'username': username, 'password': password}).then((res) {
      var body = jsonDecode(res.body);
      if (res.statusCode < 300) {
        return Res(success: true, message: body['token']);
      }
      return Res(success: false, message: 'Wrong Credentials');
    });
  }

  static Future<http.Response> getcatagories() {
    return http.get(_api(url: '/api/categories/'), headers: _headers);
  }

  // getProducts Helpers
  static getProductsCategory(List products, String category) {
    return products.where((el) {
      return el['product_category'] == category;
    }).toList();
  }

  static getProductsBestseller(List products) {
    return products.where((el) {
      return el['bestseller'] == true;
    }).toList();
  }

  static getProductsFeatured(List products) {
    return products.where((el) {
      return el['featured'] == true;
    }).toList();
  }

  static Future<http.Response> getProducts() {
    return http.get(_api(url: '/api/products/'), headers: _headers);
  }

  static getProduct(int id) {
    return http
        .get(_api(url: '/api/products/$id/'), headers: _headers)
        .then((value) => value.body);
  }

  static Future getTutorialList() {
    return http.get(_api(url: '/api/tutorials/'), headers: _headers);
  }

  static Future getTutorial(int id) {
    return http.get(_api(url: '/api/tutorials/$id/'), headers: _headers);
  }

  static registeruser(String uname, String mail, String pass1, String pass2) {
    return http.post(_api(url: '/api/rest-auth/registration/'), body: {
      "username": uname,
      "email": mail,
      "password1": pass1,
      "password2": pass2
    }).then((res) {
      Map body = jsonDecode(res.body);
      //print('body $body');

      if (res.statusCode < 300) {
        return Res(success: true, message: body["detail"]);
      }

      final key = body.keys.first;
      return Res(success: false, message: body[key][0]);

      /*if (body["username"] != null) {
         
        return Res(success: false, message: body["username"] );
      } else if (body["email"] != null) {
        
        return Res(success: false, message:  body["email"]);
      } else if (body["password1"] != null) {
         
        return Res(success: false, message: body["password1"] );
      }else if(body["non_field_errors"] != null){
      return Res(success: false, message:body["non_field_errors"] );}*/
    });
  }

  static getcart(){
    return http.get(_api(url: '/api/rest-auth/registration/'),headers: _headers).then((res) {
      Map body = jsonDecode(res.body);
    });
    }
}