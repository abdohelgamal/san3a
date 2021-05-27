import 'package:flutter/material.dart';
import 'dart:ui';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
          'assets/Logoscreen.png',width: double.maxFinite,height: double.maxFinite,fit: BoxFit.fill,
        )
        );
  }
    //  Timer(Duration(seconds: 2), () {
    //    currentview = Interface();
    // });
}
