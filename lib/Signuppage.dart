import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:san3a/api/auth.dart';
import 'package:san3a/api/res.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

enum Typeofuser { customer, seller }
Typeofuser _typeuser = Typeofuser.customer;

class _SignupState extends State<Signup> {
  Future<void> _createuserbutton(
      String mail, String uname, String pass1, String pass2) async {
         if(uname == null || mail == null || pass1 == null || pass2 == null ){   setState(() {
      response = ' Please enter missing data';});
      return;}
      print('$mail - $uname - $pass1 - $pass2');
    Res data = await AuthApi.registeruser(uname, mail, pass1, pass2);
   /* print(data);
       setState(() {
      response = data.message;
      return;
    });*/
    
     setState(() {
      response = data.message;
    });
  
  }

  String response = ' ';
  bool passsecure = true;
  String mail;
  String uname;
  String pass1;
  String pass2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                iconSize: 40,
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to our store',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Radio(
                      value: Typeofuser.customer,
                      groupValue: _typeuser,
                      onChanged: (Typeofuser val) {
                        setState(() {
                          _typeuser = val;
                        });
                      }),
                  Text(
                    'I am a customer',
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Row(children: [
                  Radio(
                      value: Typeofuser.seller,
                      groupValue: _typeuser,
                      onChanged: (Typeofuser val) {
                        setState(() {
                          _typeuser = val;
                        });
                      }),
                  Text(
                    'I am a seller',
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                uname = value;
              },
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Your name',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              onChanged: (value) {
                mail = value;
              },
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              obscureText: passsecure,
              onChanged: (v) {
                pass1 = v;
              },
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              obscureText: passsecure,
              onChanged: (v) {
                pass2 = v;
              },
              style: TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Repeat password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    passsecure = !passsecure;
                  });
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: 35,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Show Password',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Text('$response',style: TextStyle(fontSize: 20,color: Colors.blue.shade700),),
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
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.red))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.red; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    _createuserbutton(mail, uname, pass1, pass2);
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
