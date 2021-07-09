import 'package:flutter/material.dart';
import 'package:san3a/Categories.dart';
// ignore: unused_import
import 'ForgotPassword.dart';
// ignore: unused_import
import 'LandingLayout.dart';
// ignore: unused_import
import 'TutorialList.dart';
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

class Btmsheet extends StatefulWidget {
  @override
  _BtmsheetState createState() => _BtmsheetState();
}

class _BtmsheetState extends State<Btmsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerRequest()));
              },
              child: Text(
                'Customer request',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categories()));
              },
              child: Text(
                'Categories',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TutorialList()));
              },
              child: Text(
                'Tutorials',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'About us',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Help',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Settings',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class Homelanding extends StatefulWidget {
  @override
  _HomelandingState createState() => _HomelandingState();
}

class _HomelandingState extends State<Homelanding> {
  List<dynamic> pagename = [Landing(), ' ', Cart(), UserProfile()];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  bottomSheet: Btmsheet(),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        backgroundColor: Colors.blue,
        onTap: (index) {
          if (index == 0 || index == 2 || index == 3) {
            setState(() {
              _index = index;
            });
          }
        },
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: Icon(Icons.search),
                onTap: () {
                  if (_index != 0) {
                    setState(() {
                      _index = 0;
                    });
                  }
                },
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: Icon(Icons.dehaze_rounded),
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: (context) => Btmsheet());
                },
              ),
              label: 'More'),
        ],
      ),
      body: SafeArea(child: pagename[_index]),
      backgroundColor: Colors.white,
    );
  }
}
