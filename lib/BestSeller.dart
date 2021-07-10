import 'dart:convert';
import 'package:flutter/material.dart';
import 'api/auth.dart';
import 'Product.dart';

class _WidgetWithData {
  dynamic data;
  Widget widget;
  _WidgetWithData(this.data, this.widget);
}

class BestSeller extends StatefulWidget {
  @override
  _BestSellerState createState() => _BestSellerState();
}

enum Sorting { mostselling, mostexpensive, cheapest }

class _BestSellerState extends State<BestSeller> {
  List<_WidgetWithData> widgets = [];
  Sorting sorttype = Sorting.mostselling;

  void initState() {
    super.initState();
    AuthApi.getProducts().then((res) {
      List<_WidgetWithData> widgets = [];
      List body = jsonDecode(res.body);
      List operlist = body;
      operlist.removeWhere((element) => element['bestseller'] == false);
      operlist.forEach((element) {
        widgets.add(_WidgetWithData(
            element,
            Card(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Product(
                          itemid: element['id'],
                        );
                      },
                    ),
                  );
                },
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
            ))));
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
                onChanged: (string) {
                  final widgetsClon = widgets.sublist(0);
                  widgetsClon.sort((a, b) {
                    // if (string == Sorting.mostselling) {
                    //   return a.data['id'] - b.data['id'];
                    // }

                    if (string == Sorting.mostexpensive) {
                      return double.parse(b.data['price']) >
                              double.parse(a.data['price'])
                          ? 1
                          : -1;
                    }

                    if (string == Sorting.cheapest) {
                      return double.parse(b.data['price']) >
                              double.parse(a.data['price'])
                          ? -1
                          : 1;
                    }

                    return a.data['id'] - b.data['id'];
                  });

                  setState(() {
                    widgets = widgetsClon;
                  });
                },
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
                    child: Text('Price : high -> low'),
                    value: Sorting.mostexpensive,
                    onTap: () {
                      setState(() {
                        sorttype = Sorting.mostexpensive;
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
          children: widgets.map((e) => e.widget).toList(),
        )
      ]),
    )));
  }
}
