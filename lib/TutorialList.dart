import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:search_widget/search_widget.dart';

class TutorialList extends StatefulWidget {
  @override
  _TutorialListState createState() => _TutorialListState();
}

// List<String> datatemp = [];

class _TutorialListState extends State<TutorialList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(25, 15, 25, 40),
            child: Column(
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
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/Capture.JPG',
                              height: 120,
                              width: 200,
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tutorial Name',
                                  style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                                ),
                                Text('Instructor Name' ,style: TextStyle(fontSize: 17,)),
                                Text('No. of views' ,style: TextStyle(fontSize: 17,))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ])));
  }
}
