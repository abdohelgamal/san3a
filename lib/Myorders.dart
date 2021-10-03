import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:san3a/api/auth.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Widget> orderswidgets = [];
  List<dynamic> data = [];
  var item;
  @override
  void initState() {
    super.initState();
    Future.wait([AuthApi.getOrders()]).then((res) {
      setState(() {
        data = jsonDecode(res[0].body);
        item = data[0];
      });
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data.length == 0
          ? SafeArea(
              child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(iconSize: 40,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ), Center(child: Text('No orders yet',style: TextStyle(fontSize: 30),),)
                  ],
                ),
              ),
            )
          : SafeArea(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Orders',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close),
                                color: Colors.red,
                                iconSize: 40,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                itemCount: item["cart_items"].length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 1,
                                  );
                                },
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["cart_items"][index],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Text(
                                'Total price :  ${item['get_total_cost']}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ]))),
    );
  }
}
