import 'package:flutter/material.dart';

class BestSeller extends StatefulWidget {
  @override
  _BestSellerState createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                'Best Seller',
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Sort by',
            style: TextStyle(color: Colors.red, fontSize: 22),
          ),
          SizedBox(
            width: 50,
          ),
          //TODO: implementDropdown
          DropdownButton(
              onTap: () {},
              onChanged: (string) {},
              items: <DropdownMenuItem>[
                DropdownMenuItem(
                  child: Text('Best Match'),
                ),
                DropdownMenuItem(
                  child: Text('Top Rated'),
                ),
                DropdownMenuItem(
                  child: Text('Price : high -> low'),
                ),
                DropdownMenuItem(
                  child: Text('Price : low -> high'),
                ),
              ]),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      ListView(padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/fb logo.png',
                  height: 120,
                  width: 120,
                ),
                Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Product name',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            'no. of  Reviews',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[600],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '4.7',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Product price',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.shopping_cart_outlined,
                              color: Colors.red),
                          onPressed: () {})
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
        shrinkWrap: true,
      )
    ])));
  }
}
