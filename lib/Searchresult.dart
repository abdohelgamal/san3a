import 'dart:convert';
import 'package:advanced_search/advanced_search.dart';
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
  List<Widget> prodwidgets = [];
  List<String> searchableList = [];
  void initState() {
    super.initState();
    AuthApi.getProducts().then((res) {
      List prods = jsonDecode(res.body);
      for (int i = 0; i < prods.length; i++) {
        searchableList.add(prods[i]['name']);
      }
      if (widget.category != null) {
        print('[if] ${widget.category}');
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
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
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
                          Text(
                            '${prods[index]['name']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                            ),
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
                                        builder: (context) => Product(
                                            itemid: prods[index]['id'])));
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
              ),
            );
          }
          setState(() {
            prodwidgets = temp;
          });
        }
      } else if (widget.searchword != null) {
        print('[Else if] ${widget.searchword}');
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
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${prods[index]['name']}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                            ),
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
                                        builder: (context) => Product(
                                            itemid: prods[index]['id'])));
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  // AdvancedSearch(
                  //     // This is basically an Input Text Field
                  //     data: searchableList,
                  //     maxElementsToDisplay: 7,
                  //     onItemTap: (index, stringword) {
                  //       print('[SearchWord], $stringword');
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => Searchresults(
                  // searchword: stringword,
                  //                   )));
                  //     },
                  //     onSearchClear: () {},
                  //     onSubmitted: (value, value2) {
                  //       // now you have a submitted search
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => Searchresults(
                  // searchword: value,
                  //                   )));
                  //     },
                  //     onEditingProgress: (value, value2) {
                  //       // user is trying to lookup something, may be you want to help him?
                  //     },
                  //   ),
               
                  IconButton(
                      icon: Icon(Icons.filter_alt_outlined,
                          size: 40, color: Colors.grey),
                      onPressed: () {})
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
