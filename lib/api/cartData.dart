import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartItem {
  final int id;
  final String name;
  final int quantity;
  final int price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.quantity,
  });

  factory CartItem.fromMap(dynamic item) {
    return CartItem(
      id: item["id"],
      price: item["get_cost"],
      name: item["product"],
      quantity: item["quantity"],
    );
  }

  static CartItem fromJson(String json) {
    final dynamic item = jsonDecode(json);
    return CartItem.fromMap(item);
  }

  static List<CartItem> fromArray(List<dynamic> items) {
    return items.map((item) => CartItem.fromMap(item)).toList();
  }

  static List<CartItem> fromJsonArray(String json) {
    final List<dynamic> items = jsonDecode(json);
    return fromArray(items);
  }
}

class Cart {
  final int id;
  final String owner;
  final String date;
  final List<CartItem> items;

  Cart({
    @required this.id,
    @required this.owner,
    @required this.date,
    @required this.items,
  });

  factory Cart.fromMap(dynamic cart) {
    return Cart(
      id: cart["id"],
      owner: cart["owner"],
      items: CartItem.fromArray(cart["items"]),
      date: cart["date_ordered"],
    );
  }

  static Cart fromJson(String cartJson, String itemsJson) {
    final dynamic cart = jsonDecode(cartJson);
    cart["items"] = jsonDecode(itemsJson);
    return Cart.fromMap(cart);
  }
}

class CartProvider with ChangeNotifier {
  Cart _cart;
  Cart get cart => _cart;
  
  set cart(Cart cart) {
    this._cart = cart;
    notifyListeners();
  }
}
