import 'dart:convert';
import 'package:flutter/material.dart';
import 'api/auth.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Map<String, dynamic> prod;
  int itemnumber = 1;

  void initState() {
    super.initState();
    AuthApi.getProduct(2).then((res) {
      setState(() {
        prod = jsonDecode(res.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListView(
            shrinkWrap: true,
            children: prod == null
                ? []
                : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                        ),
                        IconButton(
                            color: Colors.black,
                            icon: Icon(
                              Icons.favorite_border,
                              size: 40,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        color: Colors.black,
                        icon: Icon(
                          Icons.share_rounded,
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.network(prod['image']),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       icon: Icon(Icons.circle),
                    //       onPressed: () {},
                    //       iconSize: 40,
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${prod['name']}',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${prod['price']}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${prod['description']}',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 15,
                          icon: Icon(Icons.horizontal_rule),
                          iconSize: 23,
                          color: Colors.grey[600],
                          onPressed: () {
                            setState(() {
                              if (itemnumber > 0) itemnumber--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '$itemnumber',
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
                            setState(() {
                              itemnumber++;
                            });
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      side: BorderSide(color: Colors.red))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return Colors
                                      .red; // Use the component's default.
                                },
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]))),
                    SizedBox(
                      height: 20,
                    )
                  ]));
  }
}
