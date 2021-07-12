import 'package:flutter/material.dart';

class Interface extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to ',
                  style: TextStyle(
                    fontSize: 35,
                  )),
              Text('Sanعa',
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Explore us',
              style: TextStyle(
                fontSize: 30,
              )),
          SizedBox(
            height: 80,
          ),
          Image.asset(
            'assets/interfaceimg.png',
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            height: 60,
            width: 400,
            // ignore: deprecated_member_use
            child: RaisedButton(splashColor: Colors.red.shade200,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              textColor: Colors.white,
              color: Colors.red[700],
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 60,
            width: 400,
            // ignore: deprecated_member_use
            child: RaisedButton(splashColor: Colors.blue.shade200,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('Create account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              textColor: Colors.black,
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, 'signup');
              },
            ),
          ),
          SizedBox(
            height: 130,
          )
        ],
      ),
    );
  }
}
