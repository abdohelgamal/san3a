import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [Container(
  width: 150,
  height: 150,
  decoration: BoxDecoration(
	shape: BoxShape.circle,
	image: DecorationImage(
	  image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
	  fit: BoxFit.fill
	),
  ),
),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User name',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('User email',
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
                        height: 55,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Orders',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Address',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Contact us',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Finished Orders',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Customer Request',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Tutorial',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Rate Our App',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
                        ),
                        trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                        )),
                  ),const Divider(height: 0.5,indent:25 ,endIndent: 25,),
                  // ignore: deprecated_member_use
                  FlatButton(onPressed: (){},
                                    child: ListTile(
                        title: Text(
                          'Make a Suggestion',
                          style:
                              TextStyle(fontSize: 21, color: Colors.grey.shade600),
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
    );
  }
}
