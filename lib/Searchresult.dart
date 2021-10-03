import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:san3a/Product.dart';
import 'package:san3a/api/auth.dart';

class Searchresults extends StatefulWidget {
  List products = [];
  String category;
  String searchword;
  Searchresults({this.products, this.category, this.searchword});
  @override
  _SearchresultsState createState() => _SearchresultsState();
}

class _SearchresultsState extends State<Searchresults> {
  String title = '    ';
  List<Widget> prodwidgets = [];
  List<String> searchableList = [];
  Set<String> categoriesnames = {};

  void initState() {
    super.initState();
    AuthApi.getProducts().then((res) {
      List prods = jsonDecode(res.body);
      for (int i = 0; i < prods.length; i++) {
        searchableList.add(prods[i]['name']);
        categoriesnames.add(prods[i]['product_category']);
      }
      if (widget.category != null) {
        print('[if] ${widget.category}');
        setState(() {
          title = widget.category;
        });
        List<Widget> temp = [];
        for (int index = 0; index < prods.length; index++) {
          if (prods[index]['product_category'] == widget.category) {
            temp.add(
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Product(itemid: prods[index]['id'])));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                              '${prods[index]['image']}',
                            ),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            '${prods[index]['name']}',maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '${prods[index]['price']}',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Product(itemid: prods[index]['id'])));
                            },
                            child: Text(
                              'Shop now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          setState(() {
            prodwidgets = temp;
          });
        }
      } else if (widget.searchword != null) {
        print('[Else if] ${widget.searchword}');
        setState(() {
          title = widget.searchword;
        });
        List<Widget> temp = [];
        for (int index = 0; index < prods.length; index++) {
          if (prods[index]['name'] == widget.searchword) {
            temp.add(
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Product(itemid: prods[index]['id'])));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                              '${prods[index]['image']}',
                            ),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              '${prods[index]['name']}',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${prods[index]['price']}',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Product(itemid: prods[index]['id'])));
                            },
                            child: Text(
                              'Shop now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          setState(() {
            prodwidgets = temp;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    splashRadius: 30,
                    iconSize: 40,
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      '$title',overflow: TextOverflow.fade,maxLines: 1,
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                    primary: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    childAspectRatio: (200 / 330),
                    shrinkWrap: true,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: prodwidgets),
              )
            ])),
      ),
    );
  }
}
