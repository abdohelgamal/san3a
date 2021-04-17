import 'package:flutter/material.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Image.asset(
              'assets/SAN3A logo final.png',
            ),
          )),
    );
  }
}
