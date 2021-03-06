import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  Set<String> categoriesnames ={};
  static const double rangemax = 10000;
  static const double rangemin = 0;
  RangeValues currentRangeValues = const RangeValues(rangemin, rangemax);
  Filters(this.categoriesnames);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  iconSize: 40,
                  color: Colors.red,
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 40,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 65,
                width: double.infinity,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Container(
                          height: 60,
                          width: 150,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: Colors.red,
                            onPressed: () {},
                            child: Text(
                              'Textiles',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 60,
                        width: 150,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.red,
                          onPressed: () {},
                          child: Text(
                            'Textiles',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 60,
                        width: 150,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.red,
                          onPressed: () {},
                          child: Text(
                            'Soup',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Colors',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 40,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    splashRadius: 25,
                    icon: Icon(Icons.circle),
                    onPressed: () {},
                    iconSize: 40,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Price Range',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 40,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              RangeSlider(
                labels: RangeLabels(
                  widget.currentRangeValues.start.round().toString(),
                  widget.currentRangeValues.end.round().toString(),
                ),
                min:  widget.currentRangeValues.start.toDouble(),
                max:  widget.currentRangeValues.end.toDouble(),
                values: widget.currentRangeValues,
                onChanged: (RangeValues values) {
                  setState(() {
                    widget.currentRangeValues = values;
                  });
                },
                activeColor: Colors.blue,
                inactiveColor: Colors.grey.shade400,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 60,
                  width: double.infinity,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text(
                      'Apply Filter',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ],
    )));
  }
}
