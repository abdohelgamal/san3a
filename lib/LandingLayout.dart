import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cstmclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();

    p
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 25, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                  onSubmitted: (query) {},
                  onChanged: (e) {},
                  maxLines: 1,
                  maxLength: 40,
                  strutStyle: StrutStyle(height: 1),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Row(
                        children: [
                          IconButton(icon: Icon(Icons.search), onPressed: () {}),
                          IconButton(icon: Icon(Icons.close), onPressed: () {})
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Search for a product'),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(alignment: Alignment.topLeft, children: [
                  Image.network(
                      'https://s.mc-doualiya.com/media/display/21c166b0-933c-11e9-9920-005056bff430/w:1280/p:16x9/sissi_10.webp'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ClipPath(
                          clipper: Cstmclip(),
                          child: Container(
                            // width: 120,
                            height: 50, width: 140,
                            decoration: BoxDecoration(color: Colors.cyan),
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 20,
                              right: 40,
                            ),
                            child: Center(
                                child: Text(
                              'Best Selling',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
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
                              height: 10,
                            ),
                            Text(
                              'lorem ipsum ay klam hna 34an m4 la2y klam aktebow 3ayesz angez 9',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 15,
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
                      ),
                    ],
                  ),
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
                                    icon: Icon(CupertinoIcons.heart),
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
      ),
    );
  }
}
