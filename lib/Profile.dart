import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:san3a/api/auth.dart';

class PlaceholderAvatar extends StatefulWidget {
  String link;
  PlaceholderAvatar({this.link = ' '});
  @override
  _PlaceholderAvatarState createState() => _PlaceholderAvatarState();
}

class _PlaceholderAvatarState extends State<PlaceholderAvatar> {
  Widget x;
  void initState() {
    super.initState();

    if (widget.link == ' ') {
      x = SizedBox(
        height: 50,
      );
    } else {
      x = CircleAvatar(
        minRadius: 60,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        child: Image.network(
          '${widget.link}',
          width: 150,
          height: 150,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return x;
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String mail, username, avatar;

  void initState() {
    super.initState();
    AuthApi.getuserdata().then((res) {
      var data = jsonDecode(res.body);
  
      setState(() {
        mail = data['email'];
        username = data['username'];
        avatar = data['avatar'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasData = (mail == null || username == null || avatar == null);

    return SingleChildScrollView(
      child: SafeArea(
              child: Container(alignment: Alignment.center,
          
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:hasData
                        ? [CircularProgressIndicator()]
                        : [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                            CircleAvatar(
                              minRadius: 60,
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.white,
                              child: Image.network(
                                '$avatar',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            // PlaceholderAvatar( link : avatar ),
                            Text(
                              '$username',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('$mail',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 23,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                width: 150,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  textColor: Colors.red,
                                  color: Colors.white,
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                            SizedBox(
                              height: 35,
                            )
                          ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Orders',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Contact us',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Finished Orders',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Customer Request',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Tutorial',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Rate Our App',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                      const Divider(
                        height: 0.5,
                        indent: 25,
                        endIndent: 25,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: Text(
                              'Make a Suggestion',
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey.shade600),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          
        ),
      ),
    );
  }
}


