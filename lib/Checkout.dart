import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:san3a/Checkoutconfirm.dart';
import 'package:san3a/Pay.dart';
import 'package:san3a/api/cartData.dart';
import 'package:san3a/api/userdata.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<Widget> _buildItemsWidgets(CartProvider cartProvider) {
    List<Widget> res = [];
    final items = cartProvider.cart.items;

    for (int index = 0; index < items.length; index++) {
      final item = items[index];
      res.add(Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(item.image), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${item.price * item.quantity}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              splashRadius: 15,
                              icon: Icon(Icons.horizontal_rule),
                              iconSize: 23,
                              color: Colors.grey[600],
                              onPressed: () {
                                cartProvider.updateQuantity(index, by: -1);
                              },
                            ),
                            Text(
                              '${item.quantity}',
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              splashRadius: 15,
                              icon: Icon(
                                Icons.add,
                              ),
                              iconSize: 23,
                              color: Colors.grey[600],
                              onPressed: () {
                                cartProvider.updateQuantity(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                labelText: 'Message To Seller (optional)',
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 30,
                    ),
                    child: Text('Checkout',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 30, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SHIPPING ADDRESS ',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${userProvider.user.fname}',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Egypt',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'PAYMENT METHOD',
                        style: TextStyle(color: Colors.grey),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Pay()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/mastercard.png',
                                    width: 60,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Mastercard',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              splashRadius: 15,
                              icon: Icon(
                                Icons.arrow_right_rounded,
                              ),
                              iconSize: 35,
                              color: Colors.grey,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ITEMS',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: _buildItemsWidgets(cartProvider),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Icon(CupertinoIcons.tag_fill),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Add Promo Code',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            )),
                            SizedBox(
                              width: 100,
                            ),
                            IconButton(
                              splashRadius: 15,
                              icon: Icon(
                                Icons.arrow_right_rounded,
                              ),
                              iconSize: 35,
                              color: Colors.grey,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TOTAL',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${cartProvider.totalPrice}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Free Domestic Shipping',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 210,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.red[500],
                              textColor: Colors.white,
                              child: Text(
                                'Place Order',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Checkoutconfirm(
                                      order: {
                                        "owner":
                                            userProvider.user.id.toString(),
                                        "first_name": userProvider.user.uname,
                                        "last_name": userProvider.user.uname,
                                        "email": userProvider.user.email,
                                        "city": "Domiat",
                                        "address": "xxxxx",
                                        "postal_code": "1234",
                                        "paid": true,
                                      },
                                      products: cartProvider.cart.items,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
