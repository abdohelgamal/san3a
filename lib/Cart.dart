import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:san3a/Checkout.dart';
import 'package:san3a/api/cartData.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.cart;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Cart',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              )),
          Expanded(
            child: ListView.separated(
              itemCount: cart.items.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 1,
                );
              },
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = cart.items[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(item.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                splashRadius: 15,
                                icon: Icon(Icons.horizontal_rule),
                                iconSize: 23,
                                color: Colors.grey[600],
                                onPressed: item.quantity == 1
                                    ? null
                                    : () {
                                        cartProvider.updateQuantity(index,
                                            by: -1);
                                      },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '${item.quantity}',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 15,
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
                              SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                splashRadius: 15,
                                icon: Icon(
                                  Icons.remove,
                                ),
                                iconSize: 23,
                                color: Colors.grey[600],
                                onPressed: () {
                                  cartProvider.removeItem(item.id);
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${cartProvider.totalPrice}',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Free Domestic Shipping',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 210,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23)),
                  color: Colors.red[500],
                  textColor: Colors.white,
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Checkout()));
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ]),
      )),
    );
  }
}
