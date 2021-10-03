import 'dart:convert';
import 'package:flutter/material.dart';
import 'Searchresult.dart';
import 'api/auth.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Widget> _categories = [];
  void initState() {
    super.initState();
    AuthApi.getcatagories().then((res) {
      var categories = jsonDecode(res.body);
      List<Widget> categoriesList = [];
      for (int index = 0; index < categories.length; index++) {
        categoriesList.add(GestureDetector(
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
          child: Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: MediaQuery.of(context).size.width * 0.42,
                        height: 200,
                        child: Image.network(categories[index]['image'])),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[index]['name'].toString(),
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
        setState(() {
          _categories = categoriesList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
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
                      'Categories',
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
            GridView.count(
                physics: ScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                childAspectRatio: 0.85,
                shrinkWrap: true,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: _categories)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      )),
    );
  }
}
