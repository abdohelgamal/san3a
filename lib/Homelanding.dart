import 'package:flutter/material.dart';
// ignore: unused_import
import 'TutorialList.dart';
// ignore: unused_import
import 'TutorialPage.dart';
// ignore: unused_import
import 'Cart.dart';
// ignore: unused_import
import 'Checkout.dart';
// ignore: unused_import
import 'Checkoutconfirm.dart';
// ignore: unused_import
import 'Product.dart';
// ignore: unused_import
import 'BestSeller.dart';
// ignore: unused_import
import 'Searchresult.dart';
// ignore: unused_import
import 'Profile.dart';
// ignore: unused_import
import 'CustomerRequest.dart';

class Homelanding extends StatefulWidget {
  @override
  _HomelandingState createState() => _HomelandingState();
}
//TODO: Fix scrolling in searchresults , tutoriallist and tutorialpage
class _HomelandingState extends State<Homelanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: (int) {},
        iconSize: 30,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dehaze_rounded), label: 'More'),
        ],
      ),
      body: SafeArea(child: Searchresults()),
      backgroundColor: Colors.white,
    );
  }
}
