import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:san3a/api/auth.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Widget> orderswidgets;
  List<dynamic> data;
  @override
  void initState() {
    super.initState();
    AuthApi.getOrders().then((res) {
      data = jsonDecode(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Cart',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                    )),
                Expanded(
                    child: ListView.separated(
                  itemCount: orderswidgets.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 1,
                    );
                  },
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = data[index];

                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(item.image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${item.price * item.quantity}',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${item.quantity}',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ))
              ]))),
    );
  }
}
