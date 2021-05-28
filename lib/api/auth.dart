import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:san3a/api/res.dart';

class AuthApi {
  static Uri _api({String url = '/'}) {
    return Uri.parse('http://20.37.244.156$url');
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

      // TODO: save token
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

  static Future getProducts() {
    return http.get(_api(url: '/api/products/'));
  }
}