import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                iconSize: 40,
                color: Colors.red,
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hi,',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome Back',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              labelText: 'Your name',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Divider(
                  height: 1,
                  indent: 15,
                  endIndent: 15,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Text(
                'or',
                style: TextStyle(color: Colors.grey, fontSize: 22),
              ),
              Expanded(
                child: Divider(
                  indent: 15,
                  endIndent: 15,
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),
          //TODO: Add fb and google photos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          side: BorderSide(color: Colors.red))),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.red; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
        ])));
  }
}
