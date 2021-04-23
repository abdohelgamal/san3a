import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 40),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      iconSize: 40,
                      color: Colors.red,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    //TODO: searchwidget
                    // SearchWidget(
                    //     dataList: datatemp,
                    //     popupListItemBuilder: popupListItemBuilder,
                    //     selectedItemBuilder: selectedItemBuilder,
                    //     queryBuilder: queryBuilder)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.network(
                      'https://www.skynewsarabia.com/images/v1/2020/02/22/1322906/800/450/1-1322906.jpg',
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      size: 100,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'jksdfk njknsdfnk jkndsfuun uniainjd nibwdabiu abi da',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              Icons.thumb_up_outlined,
                              size: 35,
                              color: Colors.grey[700],
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              Icons.thumb_down_outlined,
                              size: 35,
                              color: Colors.grey[700],
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              Icons.vertical_align_bottom,
                              size: 35,
                              color: Colors.grey[700],
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              Icons.send_rounded,
                              size: 35,
                              color: Colors.grey[700],
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.red,
                            ),
                            label: Text(
                              'Subscribe',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ))
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1.2,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Related videos',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: (200 / 240),
                    shrinkWrap: true,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://cdn.britannica.com/30/197230-050-A72E526C/Abdel-Fattah-al-Sisi-General-Assembly-of-the-2016.jpg',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcwh4Q1hwoc5ESYzZ3HjgPB7c9ZnyYkRi6nA&usqp=CAU',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://pbs.twimg.com/profile_images/709812973519413248/dEupp81g_400x400.jpg',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://vid.alarabiya.net/images/2020/02/09/55a74730-afa6-4c08-ab79-049434184652/55a74730-afa6-4c08-ab79-049434184652_16x9_1200x676.JPG?width=1138',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcwh4Q1hwoc5ESYzZ3HjgPB7c9ZnyYkRi6nA&usqp=CAU',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://pbs.twimg.com/profile_images/709812973519413248/dEupp81g_400x400.jpg',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://vid.alarabiya.net/images/2020/02/09/55a74730-afa6-4c08-ab79-049434184652/55a74730-afa6-4c08-ab79-049434184652_16x9_1200x676.JPG?width=1138',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcwh4Q1hwoc5ESYzZ3HjgPB7c9ZnyYkRi6nA&usqp=CAU',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://pbs.twimg.com/profile_images/709812973519413248/dEupp81g_400x400.jpg',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 550,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://vid.alarabiya.net/images/2020/02/09/55a74730-afa6-4c08-ab79-049434184652/55a74730-afa6-4c08-ab79-049434184652_16x9_1200x676.JPG?width=1138',
                                        ),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: 70,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'video name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '1:35',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
