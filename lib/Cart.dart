import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.gisreportsonline.com/media/__sized__/report_images/El-Sisi_rz8JByi-crop-c0-5__0-5-1340x828-70.jpg',),
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
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              splashRadius: 15,
                              icon: Icon(Icons.horizontal_rule),
                              iconSize: 23,
                              color: Colors.grey[600],
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '5',
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
                              onPressed: () {},
                            ),
                          ],
                          
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
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
                  style: TextStyle(fontSize: 18, color: Colors.grey,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Price',
                  style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ])),
    );
  }
}