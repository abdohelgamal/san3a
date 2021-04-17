import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

double rangemax =1000000  ;
double rangemin = 0;
double currentrangemax;
double currentrangemin;
double selectedrangemax;
double selectedrangemin;

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
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
            //  TODO: Rangeslider :(

              // RangeSlider(min: rangemin,max: rangemax,
              //     values: RangeValues(currentrangemin, currentrangemax),
              //     ), 
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
                    onPressed: () {},
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
