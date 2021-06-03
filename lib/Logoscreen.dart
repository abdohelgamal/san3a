import 'dart:async';

import 'package:flutter/material.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {Navigator.pushReplacementNamed(context, 'interface');
     // Navigator.pushNamed(context, 'interface');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/Logoscreen.png',
      width: double.maxFinite,
      height: double.maxFinite,
      fit: BoxFit.fill,
    ));
  }
}
