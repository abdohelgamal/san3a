// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'package:san3a/CustomerRequest.dart';
// ignore: unused_import
import 'ForgotPassword.dart';
// ignore: unused_import
import 'Interface.dart';
// ignore: unused_import
import 'Signuppage.dart';
// ignore: unused_import
import 'Logoscreen.dart';
// ignore: unused_import
import 'Searchresult.dart';
// ignore: unused_import
import 'Login.dart';
// ignore: unused_import
import 'Checkoutconfirm.dart';
// ignore: unused_import
import 'Cart.dart';
// ignore: unused_import
import 'Checkout.dart';
// ignore: unused_import
import 'Homelanding.dart';
// ignore: unused_import
import 'Pay.dart';
// ignore: unused_import
import 'Filters.dart';
// ignore: unused_import
import 'Product.dart';
// ignore: unused_import
import 'Profile.dart';
// ignore: unused_import
import 'Selleraddproduct.dart';
// ignore: unused_import
import 'TutorialList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Widget currentview = LogoScreen();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: TutorialList(),
          resizeToAvoidBottomInset: true,
        ));
    //  Timer(Duration(seconds: 2), () {
    //    currentview = Interface();
    // });
  }
}
