import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:san3a/api/cartData.dart';
import 'package:san3a/api/res.dart';

class AuthApi {
  static String token = '';
  static get _headers => {"Authorization": 'Token $token'};

  static Uri _api({String url = '/'}) {
    return Uri.parse('http://20.52.51.184$url');
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

      if (res.statusCode < 300) {
        return Res(success: true, message: body["detail"]);
      }

      final key = body.keys.first;
      return Res(success: false, message: body[key][0]);
    });
  }

  static Future getCart() {
    return http.get(_api(url: '/api/cart/'), headers: _headers);
  }

  static Future getCartItems() {
    return http.get(_api(url: '/api/cart_items/'), headers: _headers);
  }

  static Future decreaseCartItem(int id, int productId, int quantity) {
    return http.put(
      _api(url: '/api/cart_items/$id/'),
      headers: _headers,
      body: {
        "product": productId,
        "quantity": quantity,
      },
    );
  }

  static Future<http.Response> createCartItem(CartItem p) {
    return http.post(
      _api(url: '/api/cart_items/'),
      headers: _headers,
      body: {
        "product": p.id.toString(),
        "quantity": p.quantity.toString(),
      },
    );
  }

  static Future<http.Response> createOrder(Map order) {
    return http.post(
      _api(url: '/api/orders/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Token $token'
      },
      body: jsonEncode(order),
    );
  }

  static Future<http.Response> getOrders() async {
    return await http.get(
      _api(url: '/api/orders/'),
      headers: _headers,
    );
  }
}