import 'dart:ui';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              iconSize: 40,
              color: Colors.red,
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          SizedBox(
            height: 110,
          ),
          Text('Forget Password',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(18),
                  labelText: 'Please enter your email or phone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.red))),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.red; // Use the component's default.
                  },
                ),
              ),
              onPressed: () {},
              child: Text(
                'Send',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }
}