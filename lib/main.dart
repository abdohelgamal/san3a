import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:san3a/Categories.dart';
import 'package:san3a/api/auth.dart';
import 'package:san3a/api/userdata.dart';
import 'LandingLayout.dart';
import 'BestSeller.dart';
import 'CustomerRequest.dart';
import 'ForgotPassword.dart';
import 'Interface.dart';
import 'Signuppage.dart';
import 'Logoscreen.dart';
import 'Login.dart';
import 'Checkoutconfirm.dart';
import 'Cart.dart';
import 'Checkout.dart';
import 'Homelanding.dart';
import 'Pay.dart';
import 'Filters.dart';
import 'Profile.dart';
import 'Selleraddproduct.dart';
import 'TutorialList.dart';
import 'TutorialPage.dart';
import 'package:flutter/material.dart';
import 'api/userdata.dart';

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
    final cache = FlutterSecureStorage();
    cache.read(key: 'user').then((res) {
      if (res == null) return;

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final userData = jsonDecode(res);

      User user = User(
        token: userData['token'],
        id: userData['id'],
        uname: userData['uname'],
        email: userData['email'],
        fname: userData['fname'],
        lname: userData['lname'],
        image: userData['image'],
      );

      userProvider.user = user;
      AuthApi.token = userData['token'];
    });
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
          'interface': (context) {
            final userProvider =
                Provider.of<UserProvider>(context, listen: false);
            final user = userProvider.user;
            if (user != null) {
              return Homelanding();
            }
            return Interface();
          },
          'logo': (context) => LogoScreen(),
          'login': (context) => Login(),
          'lndlout': (context) => Landing(),
          'pay': (context) => Pay(),
          'profile': (context) => UserProfile(),
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
          body: LogoScreen(),
          resizeToAvoidBottomInset: true,
        ));
  }
}
