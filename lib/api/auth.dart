import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:san3a/api/res.dart';

class AuthApi {
  static Uri _api({String url = '/'}) {
    return Uri.parse('http://20.37.244.156$url');
  }
  

// TODO: check later after login isa
  static getuserdata(String u, String token) {
    return http.get(_api(url: '/api/users/$u/'),
        headers: {"Authorization": "Token $token"});
    //     .then((res) {
    //   var body = jsonDecode(res.body);
    //   List<dynamic> x = [
    //     body['id'],
    //     body['username'],
    //     body['email'],
    //     body['first_name'],
    //     body['last_name']
    //   ];
    //   return x;
    // });
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
    return http.get(_api(url: '/api/categories/'));
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
    return http.get(_api(url: '/api/products/'));
  }

  static Future getProduct(int id) {
    return http.get(_api(url: '/api/products/$id/'));
  }

  static Future getTutorialList() {
    return http.get(_api(url: '/api/tutorials/'));
  }

  static Future getTutorial(int id) {
    return http.get(_api(url: '/api/tutorials/$id/'));
  }
}
