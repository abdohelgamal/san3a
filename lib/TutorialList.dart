import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:san3a/api/auth.dart';
// import 'package:search_widget/search_widget.dart';

class TutorialList extends StatefulWidget {
  @override
  _TutorialListState createState() => _TutorialListState();
}

class _TutorialListState extends State<TutorialList> {
  List<Widget> widgets = [];
  void initState() {
    List<Widget> widget = [];
    super.initState();
    // TODO: check request
    AuthApi.getTutorialList().then((res) {
      Map<String, dynamic> tutorialsdata = jsonDecode(res.body);
      print(tutorialsdata);
      tutorialsdata.forEach((k ,v ) {
        widget.add( Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'tutpg',
                     );
                },
                icon: Stack(
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
                                'https://cdn.britannica.com/30/197230-050-A72E526C/Abdel-Fattah-al-Sisi-General-Assembly-of-the-2016.jpg'
                                // element['image'],
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
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'vid name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1:35',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ));
      });
      setState(() {
        this.widgets = widgets;
      });
    });
  }

  List<String> datatemp = [];
  String currentword;
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
                      // TextField(
                      //   onSubmitted: (query) {},
                      //   onChanged: (e) {
                      //     currentword = e;
                      //   },
                      //   maxLines: 1,
                      //   strutStyle: StrutStyle(height: 1),
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.search),
                      //       suffixIcon: Row(
                      //         children: [
                      //           IconButton(
                      //               icon: Icon(Icons.search), onPressed: () {}),
                      //           IconButton(
                      //               icon: Icon(Icons.close), onPressed: () {})
                      //         ],
                      //       ),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(15)),
                      //       hintText: 'Search for a product'),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Video Gallery',
                    style: TextStyle(color: Colors.red, fontSize: 22),
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
                        children: widgets),
                  ),
                ])));
  }
}
