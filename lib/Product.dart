import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 40,
                ),
                onPressed: () {},
                color: Colors.black,
              ),
              IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.favorite_border,
                    size: 40,
                  ),
                  onPressed: () {})
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: Icon(
                Icons.share_rounded,
                size: 40,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/Capture.JPG'),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.circle),
                onPressed: () {},
                iconSize: 40,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'price',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'description',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Color(0xffe0e0e0),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  splashRadius: 15,
                  icon: Icon(Icons.horizontal_rule),
                  iconSize: 20,
                  color: Colors.grey[600],
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '5',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              Ink(
                decoration: const ShapeDecoration(
                  color: Color(0xffe0e0e0),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  splashRadius: 15,
                  icon: Icon(
                    Icons.add,
                  ),
                  iconSize: 20,
                  color: Colors.grey[600],
                  onPressed: () {},
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                            side: BorderSide(color: Colors.red))),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.red; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 20),
                        ),
                      ])))
        ]));
  }
}
