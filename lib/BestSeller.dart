import 'dart:convert';
import 'package:flutter/material.dart';
import 'api/auth.dart';
import 'Product.dart';

class BestSeller extends StatefulWidget {
  @override
  _BestSellerState createState() => _BestSellerState();
}

enum Sorting { mostselling, toprated, mostexpensive, cheapest }
Sorting sorttype = Sorting.mostselling;
//TODO : integrate sorting

class _BestSellerState extends State<BestSeller> {
  List<Widget> widgets = [];

  void initState() {
    super.initState();
    AuthApi.getProducts().then((res) {
      List<Widget> widgets = [];
      List body = jsonDecode(res.body);
      List operlist = body;
      operlist.removeWhere((element) => element['bestseller'] == false);
      operlist.forEach((element) {
        widgets.add(Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: GestureDetector(onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Product(
                              itemid: element['id'],
                            );
                          },
                        ),
                      );},
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    element['image'],
                    height: 120,
                    width: 120,
                  ),
                  Container(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
            Text(
              element['name'],
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  'no. of  Reviews',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '4.7',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Text(
              element['price'],
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
                      ],
                    ),
                  ),
                  SizedBox(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
            IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined,
                    color: Colors.red),
                onPressed: () {})
                      ],
                    ),
                  )
                ],
              ),
          ),
        )));
      });
      setState(() {
        this.widgets = widgets;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  iconSize: 40,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
                Text(
                  'Best Seller',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Sort by',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            SizedBox(
              width: 50,
            ),
            DropdownButton(
                value: sorttype,
                onTap: () {},
                onChanged: (string) {},
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    value: Sorting.mostselling,
                    child: Text('Best Match'),
                    onTap: () {
                      setState(() {
                        sorttype = Sorting.mostselling;
                      });
                    },
                  ),
                  DropdownMenuItem(
                    value: Sorting.toprated,
                    child: Text('Top Rated'),
                    onTap: () {
                      setState(() {
                        sorttype = Sorting.toprated;
                      });
                    },
                  ),
                  DropdownMenuItem(
                    child: Text('Price : high -> low'),
                    value: Sorting.mostexpensive,
                    onTap: () {
                      setState(() {
                        sorttype = Sorting.mostselling;
                      });
                    },
                  ),
                  DropdownMenuItem(
                    child: Text('Price : low -> high'),
                    value: Sorting.cheapest,
                    onTap: () {
                      setState(() {
                        sorttype = Sorting.cheapest;
                      });
                    },
                  ),
                ]),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: widgets,
        )
      ]),
    )));
  }
}
