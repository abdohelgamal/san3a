import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [
      Text('Categories',style: TextStyle(
                    color: Colors.black54,
                    fontSize: 35,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),),
    ],crossAxisAlignment: CrossAxisAlignment.start,)),
      
    );
  }
}