import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
            onPressed: () {},
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
              style:
                  TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
      SizedBox(
        height: 30,
      ),
      ListView(
        padding: const EdgeInsets.only(left: 40, right: 30),
        shrinkWrap: true,
        children: [
          Text(
            'SHIPPING ADDRESS ',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'FIRST NAME',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          Text('FDG', style: TextStyle(fontSize: 20)),
          Text(
            'DFHDFG',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'DFHDFG',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Country',
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
          Row(
            children: [
              //TODO:design payment methods cards
            ],
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
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/fb logo.png',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
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
                                        'Product size, Product Color',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
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
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        borderRadius:
                                            BorderRadius.circular(60),
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
                                        borderRadius:
                                            BorderRadius.circular(60),
                                        radius: 90,
                                        onTap: () {},
                                        hoverColor: Colors.red[200],
                                        child: Icon(
                                          Icons.add,
                                        ),
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
                        style:
                            TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          labelText: 'Message To Seller (optional)',
                        ),
                      ),SizedBox( height: 15,)
                    ],
                  ),
                ),
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
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.local_offer_outlined,
                  size: 35,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Add Promo Code',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
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
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Price',
                    style: TextStyle(fontSize: 25, color: Colors.black),
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
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.red[500],
                  textColor: Colors.white,
                  child: Text(
                    'Place Order',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
            ]),
    ));
  }
}
