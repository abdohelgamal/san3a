import 'dart:convert';
import 'dart:ui';
import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:san3a/Product.dart';
import 'package:san3a/Searchresult.dart';
import 'package:san3a/api/auth.dart';
import 'dart:math';

class Cstmclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 25, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Widget> _categories = [];
  List<Widget> _featured = [];
  List<Widget> _sellerBest = [];

  void initState() {
    super.initState();

    Future.wait([
      AuthApi.getcatagories(),
      AuthApi.getProducts(),
    ]).then((responses) {
      http.Response categoriesRes = responses[0];
      http.Response productsRes = responses[1];
      List products = jsonDecode(productsRes.body);
      List categories = jsonDecode(categoriesRes.body);
      var featuredItem = AuthApi.getProductsFeatured(products)[0];
      List bestSeller = AuthApi.getProductsBestseller(products);

      final _search = Set<String>();

      for (int i = 0; i < products.length; i++) {
        _search.add(products[i]['name']);
        // if (searchableList.contains(products[i]['name']) == false) {
        //   searchableList.add(products[i]['name']);
        // }
      }
      // print(searchableList);
      List<Widget> categoriesList = [];
      for (int index = 0; index < categories.length; index++) {
        categoriesList.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Searchresults(
                      category: (categories[index]['name']).toString(),
                    );
                  },
                ),
              );
            },
            child: Column(
              children: [
                Image.network(
                  categories[index]['image'],
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  categories[index]['name'].toString(),
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                )
              ],
            ),
          ),
        );
      }

      List<Widget> featured = [
        Image.network(
          featuredItem['image'],
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ClipPath(
                clipper: Cstmclip(),
                child: Container(
                  // width: 120,
                  height: 50, width: 140,
                  decoration: BoxDecoration(color: Colors.cyan),
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 40,
                  ),
                  child: Center(
                      child: Text(
                    'Best Selling',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Product',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    featuredItem['description'],
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Product(
                              itemid: featuredItem['id'],
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Purchase now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    color: Colors.red,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ];

      List<Widget> bestSellerList = [];
      for (int index = 0; index < min(bestSeller.length, 6); index++) {
        bestSellerList.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Product(
                    itemid: bestSeller[index]['id'],
                  );
                },
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                bestSeller[index]['image'],
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  bestSeller[index]['name'],
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
                      bestSeller[index]['price'].toString(),
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
      }
      setState(() {
        _categories = categoriesList;
        _featured = featured;
        _sellerBest = bestSellerList;
        searchableList = _search.toList();
      });
    });
  }

  List<String> searchableList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              AdvancedSearch(
                // This is basically an Input Text Field
                data: searchableList,
                onItemTap: (index, stringword) {
                  print('[SearchWord], $stringword');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Searchresults(
                                searchword: stringword,
                              )));
                },
                onSearchClear: () {},
                // onSubmitted: (value, value2) {
                //   // now you have a submitted search
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => Searchresults(
                //                 searchword: value,
                //               )));
                // },
                onEditingProgress: (value, value2) {
                  // user is trying to lookup something, may be you want to help him?
                },
                maxElementsToDisplay: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Stack(alignment: Alignment.topLeft, children: _featured),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'categories');
                    },
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 150,
                padding: EdgeInsets.symmetric(vertical: 1),
                child: GridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.2,
                  scrollDirection: Axis.horizontal,
                  children: _categories,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'bestseller');
                    },
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 310,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 1.25,
                    mainAxisSpacing: 25,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: _sellerBest),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
