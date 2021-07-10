import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:san3a/Myorders.dart';
import 'package:san3a/api/auth.dart';
import 'package:san3a/api/cartData.dart';

class Checkoutconfirm extends StatefulWidget {
  Map order;
  List<CartItem> products;

  Checkoutconfirm({
    @required this.order,
    @required this.products,
  });

  @override
  _CheckoutconfirmState createState() => _CheckoutconfirmState();
}

class _CheckoutconfirmState extends State<Checkoutconfirm> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    Future.wait(
      widget.products.map((p) {
        return AuthApi.createCartItem(p);
      }).toList(),
    ).then((responses) {
      return responses.map((r) {
        return jsonDecode(r.body)['id'];
      }).toList();
    }).then((cartItems) {
      widget.order["cart_items"] = cartItems;
      return AuthApi.createOrder(widget.order);
    }).then((res) {
      print(jsonDecode(res.body));
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/Capture.JPG',
                    height: 200,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Order Placed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Your order was placed successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'For more details, Check All My Orders page under Profile tab',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Wrap(alignment: WrapAlignment.center, children: [
                    Container(
                      height: 60,
                      width: 220,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                        color: Colors.red[500],
                        textColor: Colors.white,
                        child: Text(
                          'MY ORDERS',
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyOrders()));
                        },
                      ),
                    ),
                  ])
                ],
              ),
      ),
    );
  }
}
