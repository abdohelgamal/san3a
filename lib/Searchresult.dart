import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_widget/search_widget.dart';

class Searchresults extends StatefulWidget {
  @override
  _SearchresultsState createState() => _SearchresultsState();
}

List<String> x = ['sfdgs', 'sfdsaf'];

class _SearchresultsState extends State<Searchresults> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 40,
              color: Colors.red,
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
            //TODO:searchwidget
            // SearchWidget(
            //   dataList: x,
            //   popupListItemBuilder: (String item) {},
            //   selectedItemBuilder:
            //       (String item, void Function() deleteSelectedItem) {},
            //   queryBuilder: (String query, List<String> list) {},
            // )
            Row(children: [
              IconButton(
                  icon: Icon(Icons.search, size: 40, color: Colors.grey),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.filter_alt_outlined,
                      size: 40, color: Colors.grey),
                  onPressed: () {}),
            ])
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ]));
  }
}
