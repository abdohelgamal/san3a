import 'package:flutter/material.dart';

class SellerAddProduct extends StatefulWidget {
  @override
  _SellerAddProductState createState() => _SellerAddProductState();
}

class _SellerAddProductState extends State<SellerAddProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      iconSize: 40,
                      color: Colors.red,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    )),
              ),
              Text(
                'Welcome to our store',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text('What will you add today?',
                  style: TextStyle(fontSize: 30, color: Colors.grey.shade600)),
              SizedBox(
                height: 20,
              ),
              Text('Product name :',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600)),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Quantity :',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600)),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Specifications :',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600)),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Price of the product :',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600)),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Implementation time :',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600)),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Delivery Service :',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600)),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return Colors.red; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
