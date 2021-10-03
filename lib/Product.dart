import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:san3a/api/cartData.dart';
import 'api/auth.dart';

class Product extends StatefulWidget {
  int itemid;
  Product({this.itemid});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Map<String, dynamic> prod;
  List<Widget> _relatedprods = [];
  int itemnumber = 1;
  void initState() {
    super.initState();
    AuthApi.getProduct(this.widget.itemid).then((body) {
      prod = jsonDecode(body);
    });
    AuthApi.getProducts().then((res) {
      List relatedproducts = jsonDecode(res.body);
      List<Widget> rprodlist = [];
      for (int index = 0; index < relatedproducts.length; index++) {
        rprodlist.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Product(
                    itemid: relatedproducts[index]['id'],
                  );
                },
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                relatedproducts[index]['image'],
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  relatedproducts[index]['name'],
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      relatedproducts[index]['price'].toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                        color: Colors.red,
                        icon: Icon(CupertinoIcons.heart),
                        iconSize: 20,
                        onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ));
        setState(() {
          _relatedprods = rprodlist;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isInCart(widget.itemid);

    return Scaffold(
      body: Container(
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
                      Image.network(prod['image'].toString()),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              '${prod['name']}',softWrap: true,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
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
                      Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runAlignment: WrapAlignment.start,
                          direction: Axis.vertical,
                          children: [
                            Text(
                              'Related to :',
                              style:
                                  TextStyle(fontSize: 23, color: Colors.blue),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              prod['tags'].isEmpty ? ' ' : '${prod['tags']}',
                              // '${prod['tags']}',
                              style: TextStyle(
                                  fontSize: 23, color: Colors.black54),
                            ),
                          ]),
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
                            onPressed: isInCart || itemnumber == 1
                                ? null
                                : () {
                                    setState(() {
                                      itemnumber--;
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
                            onPressed: isInCart
                                ? null
                                : () {
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
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                        side: BorderSide(color: Colors.red))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return Colors
                                        .red; // Use the component's default.
                                  },
                                ),
                              ),
                              onPressed: isInCart
                                  ? () {
                                      cartProvider.removeItem(prod["id"]);
                                    }
                                  : () {
                                      cartProvider.addItem(
                                        prod["id"],
                                        prod["name"],
                                        double.parse(prod["price"]),
                                        prod["image"],
                                        itemnumber,
                                      );
                                    },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      isInCart
                                          ? Icons.close
                                          : Icons.shopping_cart_outlined,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      isInCart
                                          ? 'Remove from cart'
                                          : 'Add to cart',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ]))),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Related Products',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 340,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 0.66,
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: _relatedprods),
                      ),
                    ])),
    );
  }
}
