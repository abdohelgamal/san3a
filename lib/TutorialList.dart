import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:san3a/api/auth.dart';
import 'package:url_launcher/url_launcher.dart' as lnch;
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

    AuthApi.getTutorialList().then((res) {
      List tutoriallistadata = jsonDecode(res.body);
      print(tutoriallistadata);
      tutoriallistadata.forEach((element) {
        widget.add(Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${element['title']}',
                style: TextStyle(fontSize: 27, color: Colors.red),
              ),
              Text(
                '${element['description']}',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  lnch.launch('${element['video_url']}');
                },
                child: Text(
                  '${element['video_url']}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ));
      });
      setState(() {
        this.widgets = widget;
      });
    });
  }

  List<String> datatemp = [];
  String currentword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      width: 20,
                    ),
                    Text(
                      'Tutorials',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black54,
                      ),
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
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widgets.length,
                    // widgets.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // return widgets[index];
                      return widgets[index];
                    },
                  ),
                )
              ]),
        )));
  }
}
