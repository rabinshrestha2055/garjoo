import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:garjoo/screens/homepage/classifiedads/classified_ads.dart';
import 'package:garjoo/screens/homepage/carousel/carousel.dart';
import 'package:garjoo/screens/homepage/category/category.dart';
import 'package:garjoo/screens/homepage/discount/discountoffer.dart';
import 'package:garjoo/screens/homepage/featuredcategory/featured_categories.dart';
import 'package:garjoo/screens/homepage/featuredproduct/featured_products.dart';
import 'package:garjoo/screens/homepage/newArrival/newarivals.dart';
import 'package:garjoo/screens/homepage/quicklink/quicklinks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showContainer = false;
  @override
  void initState() {
    super.initState();
    showContainer = false;
  }

  void show() {
    setState(() {
      showContainer = !showContainer;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: showContainer == false
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.95,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: Drawer(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              show();
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.orange,
                              child:
                                  Icon(Icons.shopping_bag, color: Colors.white),
                            ),
                          ),
                          Text('Market'),
                          SizedBox(height: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.shopping_bag,
                                    color: Colors.white),
                              ),
                              Text('Services'),
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.shopping_bag,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Jobs'),
                              ),
                            ],
                          ),
                          SizedBox(height:15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.shopping_bag,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Motors'),
                              ),
                            ],
                          ),
                             SizedBox(height:15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:14.0),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.shopping_bag,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Accomodation',style:TextStyle(fontSize:12)),
                              ),
                            ],
                          ),
                          SizedBox(height:15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.shopping_bag,
                                    color: Colors.white),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text('Real Estate',style:TextStyle(fontSize:12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Visibility(
                        visible: showContainer,
                        child: Card(
                            elevation: 2,
                            child: Container(
                              width: 200,
                              // height: 89,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Mens Fashion"),
                                    ),
                                    ExpansionTile(
                                      childrenPadding:
                                          EdgeInsets.only(right: 140),
                                      title: Text('Shirts'),
                                      children: [
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                      ],
                                    ),
                                    Divider(height: 1),
                                    ExpansionTile(
                                      childrenPadding:
                                          EdgeInsets.only(right: 140),
                                      title: Text('Jacket'),
                                      children: [
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                      ],
                                    ),
                                    Divider(height: 1),
                                    ExpansionTile(
                                      childrenPadding:
                                          EdgeInsets.only(right: 140),
                                      title: Text('Pants'),
                                      children: [
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                      ],
                                    ),
                                    Divider(height: 1),
                                    ExpansionTile(
                                      childrenPadding:
                                          EdgeInsets.only(right: 140),
                                      title: Text('Jeans'),
                                      children: [
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                        Text('rabin'),
                                      ],
                                    ),
                                    Divider(height: 1),
                                  ]),
                            )))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
        actions: [
          Stack(children: [
            Positioned(
              top: 22,
              left: 2,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
                child: Text(
                  '5',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}),
          ]),
          Stack(children: [
            Positioned(
              top: 24,
              left: 8,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
                child: Text(
                  '10',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.notifications_outlined), onPressed: () {}),
          ]),
        ],
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Category(),

            //Carousel
            Carousel1(),

            SizedBox(height: 15),

            QuickLink(),
            //New Arivals
            SizedBox(
              height: 15,
            ),
            Arrival(),
            SizedBox(height: 15),

            //Discount

            DiscountOffers(),

            SizedBox(height: 20),

            //Ads
            ClassifedAds(),

            //Featured Categories
            FeaturedCategory(),

            SizedBox(height: 10),

            //Featured Product
            FeaturedProduct(),

            SizedBox(height: 25),
          ]),
        ],
      ),
    );
  }
}

void openContainer() {
  Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: Text('heloo'),
  );
}
