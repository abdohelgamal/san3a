import 'package:provider/provider.dart';
import 'package:san3a/Categories.dart';
import 'package:san3a/api/userdata.dart';
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
import './api/userdata.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    // TODO: get cached token here if exists
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'bestseller': (context) => BestSeller(),
          // 'botsheet': (context) => Btmsheet(),
          'cart': (context) => Cart(),
          'categories': (context) => Categories(),
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
