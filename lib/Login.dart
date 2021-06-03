import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "api/auth.dart";
import './api/userdata.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

String username, password;

class _LoginState extends State<Login> {
  String temp = '';

  void _loginbutton(String uname, String pass, BuildContext context) async {
    // res = await AuthApi.login(uname, pass);
    var loginData = await AuthApi.login(uname, pass);
    if (!loginData.success) {
      return setState(() {
        temp = loginData.message;
      });
    }

    AuthApi.token = loginData.message;
    var userDataRes = await AuthApi.getuserdata();
    var userData = jsonDecode(userDataRes.body);

    User user = User(
        id: userData['id'],
        uname: userData['username'],
        email: userData['email'],
        image: userData['avatar'],
        fname: userData['first_name'],
        lname: userData['last_name'],
        token: loginData.message);

    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.user = user;
    Navigator.pushNamed(context, 'homelnd');
  }

  // // ignore: missing_return
  // String _checktextval() {
  //   if (res.success == false) {
  //     return res.message;
  //   }
  //   // token = res.message;
  //   // uname = tem[1];
  //   // id = tem[0];
  //   // email = tem[2];
  //   // fname = tem[3];
  //   // lname = tem[4];
  //   Navigator.pushNamed(context, 'lndlout');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
            onChanged: (val) {
              username = val;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            style: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              labelText: 'Your Password',
            ),
            onChanged: (val) {
              password = val;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$temp',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'forgotpass');
                },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  heroTag: null,
                  child: Image.asset(
                    'assets/facebook.png',
                    height: 50,
                  ),
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
                  heroTag: null,
                  child: Image.asset(
                    'assets/twitter.png',
                    height: 50,
                  ),
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
                  heroTag: null,
                  child: Image.asset(
                    'assets/google.png',
                    height: 50,
                  ),
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
                onPressed: () => _loginbutton(username, password, context),
                // async {
                // ignore: await_only_futures
                // _loginbutton(username, password);
                // setState(() {
                //   temp = _checktextval();
                // });
                // }
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
