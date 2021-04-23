import 'dart:ui';

import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(//TODO: add searchbar
            children: [
              Stack(alignment: Alignment.centerLeft, children: [
                //TODO: add best seller banner
                
                Image.network(
                    'https://s.mc-doualiya.com/media/display/21c166b0-933c-11e9-9920-005056bff430/w:1280/p:16x9/sissi_10.webp'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Product',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'lorem ipsum ay klam hna 34an m4 la2y klam aktebow 3ayesz angez 9',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        onPressed: () {},
                        child: Text(
                          'Purchase now',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 150,
                padding: EdgeInsets.symmetric(vertical: 1),
                child: GridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1.2,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          'https://media.gemini.media/img/large/2020/4/7/2020_4_7_14_33_36_35.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://media.gemini.media/img/large/2020/4/7/2020_4_7_14_33_36_35.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://media.gemini.media/img/large/2020/4/7/2020_4_7_14_33_36_35.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),Column(
                      children: [
                        Image.network(
                          'https://media.gemini.media/img/large/2020/4/7/2020_4_7_14_33_36_35.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),Column(
                      children: [
                        Image.network(
                          'https://media.gemini.media/img/large/2020/4/7/2020_4_7_14_33_36_35.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),Column(
                      children: [
                        Image.network(
                          'https://media.gemini.media/img/large/2020/4/7/2020_4_7_14_33_36_35.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 310,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 1.25,
                  mainAxisSpacing: 25,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://cdn.al-ain.com/images/2021/3/30/145-161425-15707163970_700x400.jpg',
                          height: 200,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Prod. name',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Prod. price',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.favorite_rounded),
                                  iconSize: 20,
                                  onPressed: () {})
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://cdn.al-ain.com/images/2021/3/30/145-161425-15707163970_700x400.jpg',
                          height: 200,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Prod. name',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Prod. price',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.favorite_border),
                                iconSize: 20,
                                onPressed: () {})
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://cdn.al-ain.com/images/2021/3/30/145-161425-15707163970_700x400.jpg',
                          height: 200,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Prod. name',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Prod. price',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.favorite_border),
                                iconSize: 20,
                                onPressed: () {})
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
