import 'dart:ui';

import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              alignment: Alignment.topRight,
              icon: Icon(
                Icons.close_rounded,
                size: 40,
              ),
              onPressed: () {},
              color: Colors.red,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Cart',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/fb logo.png',
                        height: 120,
                        width: 120,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Product name',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Product size',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Product price',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(60),
                                radius: 90,
                                onTap: () {},
                                hoverColor: Colors.red[200],
                                child: Icon(
                                  Icons.horizontal_rule,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '5',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(60),
                                radius: 90,
                                onTap: () {},
                                hoverColor: Colors.red[200],
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.grey,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
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
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Price',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Free Domestic Shipping',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ])),
    );
  }
}
