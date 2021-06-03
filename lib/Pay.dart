import 'package:flutter/material.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
                children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                iconSize: 40,
                color: Colors.red,
                onPressed: () {
                Navigator.pop(context);},
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/visa.png',width: 100,
                ),
                SizedBox(
                  width: 50,
                ),
                Image.asset(
                  'assets/mastercard.png',
                  width: 100,
                ),
              ],
            ),
          ),
          Text(
            'Choose the payment method this suits you',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[400],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Card Type',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Expiry Date',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),SizedBox(
            height: 10,
          ),
          Text(
            'Card Number',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),SizedBox(
            height: 10,
          ),
          Text(
            'CVV Number',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 180,
            height: 60,
            // ignore: deprecated_member_use
            child: RaisedButton(
                textColor: Colors.black54,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {},
                color: Colors.red,
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 20,color: Colors.white
                  ),
                )),
          ),SizedBox(width: 50,),
        ])));
  }
}
