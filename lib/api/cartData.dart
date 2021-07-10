import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartItem {
  final int id;
  final String name;
  final double price;
  final String image;
  int quantity;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "image": image,
      "quantity": quantity,
    };
  }

  factory CartItem.fromMap(dynamic item) {
    return CartItem(
      id: item["id"],
      price: item["price"],
      name: item["name"],
      quantity: item["quantity"],
      image: item["image"],
    );
  }

  static List<CartItem> fromArray(List<dynamic> items) {
    return items.map((item) => CartItem.fromMap(item)).toList();
  }
}

class CartModel {
  final int ownerId;
  final List<CartItem> items;

  CartModel({
    @required this.ownerId,
    @required this.items,
  });

  String toJson() {
    return jsonEncode({
      "ownerId": ownerId,
      "items": items.map((item) => item.toMap()).toList(),
    });
  }

  factory CartModel.fromMap(int ownerId, dynamic cart) {
    return CartModel(
      ownerId: ownerId,
      items: CartItem.fromArray(cart["items"]),
    );
  }

  static CartModel fromJson(int ownerId, String json) {
    final dynamic cart = json == null ? {"items": []} : jsonDecode(json);
    return CartModel.fromMap(ownerId, cart);
  }
}

class CartProvider with ChangeNotifier {
  final _cache = FlutterSecureStorage();
  CartModel _cart;
  CartModel get cart => _cart;
  double get totalPrice {
    double res = 0;
    cart.items.forEach((item) => res += item.price * item.quantity);
    return res;
  }

  void init(int ownerId, String json) {
    cart = CartModel.fromJson(ownerId, json);
  }

  void _store() async {
    await _cache.write(key: 'cart.${_cart.ownerId}', value: _cart.toJson());
  }

  set cart(CartModel cart) {
    this._cart = cart;
    notifyListeners();
  }

  void updateQuantity(int index, {int by = 1}) {
    final item = cart.items[index];
    item.quantity = item.quantity + by;
    notifyListeners();
    _store();
  }

  int _isInCart(int id) {
    return cart.items.indexWhere((item) => item.id == id);
  }

  bool isInCart(int id) {
    return _isInCart(id) != -1;
  }

  void addItem(
    int id,
    String name,
    double price,
    String image,
    int quantity,
  ) {
    cart.items.add(
      CartItem.fromMap({
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "quantity": quantity,
      }),
    );
    notifyListeners();
    _store();
  }

  void removeItem(int id) {
    cart.items.removeAt(_isInCart(id));
    notifyListeners();
    _store();
  }
}
