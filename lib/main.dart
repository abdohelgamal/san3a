import 'LandingLayout.dart';
import 'BestSeller.dart';
import 'CustomerRequest.dart';
import 'ForgotPassword.dart';
import 'Interface.dart';
import 'Signuppage.dart';
import 'Logoscreen.dart';
import 'Searchresult.dart';
import 'Login.dart';
import 'Checkoutconfirm.dart';
import 'Cart.dart';
import 'Checkout.dart';
import 'Homelanding.dart';
import 'Pay.dart';
import 'Filters.dart';
import 'Product.dart';
import 'Profile.dart';
import 'Selleraddproduct.dart';
import 'TutorialList.dart';
import 'TutorialPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'bestseller': (context) => BestSeller(),
          'cart': (context) => Cart(),
          'chkout': (context) => Checkout(),
          'chkoutconfirm': (context) => Checkoutconfirm(),
          'custreq': (context) => CustomerRequest(),
          'filters': (context) => Filters(),
          'forgotpass': (context) => Forgotpassword(),
          'homelnd': (context) => Homelanding(),
          'interface': (context) => Interface(),
          'logo': (context) => LogoScreen(),
          'login': (context) => Login(),
          'lndlout': (context) => Landing(),
          'pay': (context) => Pay(),
          'product': (context) => Product(),
          'profile': (context) => UserProfile(),
          'searchrslt': (context) => Searchresults(),
          'selleradd': (context) => SellerAddProduct(),
          'signup': (context) => Signup(),
          'tutlst': (context) => TutorialList(),
          'tutpg': (context) => TutorialPage()
        },
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Login(),
          resizeToAvoidBottomInset: true,
        ));
  }
}
