import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/carouselProvider.dart';
import 'package:provider/provider.dart';

class Navigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
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
                  icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
            ]),
          ],
        ),
        body: ListView(
          children: [
            Center(child: Text('JBL Headphone')),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rs 49",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white,
                          ),
                          Text(
                            '4.9',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ],
                      ),
                    ))
              ],
            )),

            Container(
              height: 250,
              width: 300,
              child: ChangeNotifierProvider(
      create: (context)=>CarouselProvider(),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Card(
            borderOnForeground: true,
            child: Consumer<CarouselProvider>(builder:
            (context,value,child){
              return Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Carousel(
                boxFit: BoxFit.fill,
                images: value.getCarousel
                    .map((eachItem) => AssetImage(eachItem.image))
                    .toList(),
                dotBgColor: Colors.transparent,
                autoplay: true,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 5.0,
                indicatorBgPadding: 2.0,
              ),
            );
            }
            ))),)),
               SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Product',style: TextStyle(fontSize:16),),
                  SizedBox(width:10),
                    Text('Description',style: TextStyle(fontSize:16),),
                     SizedBox(width:10),
                      Text('Review',style: TextStyle(fontSize:16),),
                ],
              ),
                SizedBox(height:20),
              Card(
                elevation: 0.0,
                margin: EdgeInsets.only(left:10,right:10),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('Primary Address'),
                               Text('Address'),
                            ],
                          ),
                            Column(
                            children: [
                              Text('Primary Address'),
                               Text('Address'),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height:20),
                        Column(
                         
                            children: [
                              Text('Location'),
                               Text('Address'),
                            ],),
                    ],
                  ),
                )
              ),
            SizedBox(height:10),
                 Card(
                   elevation: 0.0,
                margin: EdgeInsets.only(left:10,right:10),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Delivery Method",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                         
                          Text("Home Delivery",style: TextStyle(fontSize:14),),

                       ],
                     ),
                       SizedBox(height:12),
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Total Days",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                         
                          Text("4-6 days  ",style: TextStyle(fontSize:14),),

                       ],
                     ),
                       SizedBox(height:12),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Payment Method",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                         
                          Text("Cash on  Delivery",style: TextStyle(fontSize:14),),

                       ],
                     ),
                       SizedBox(height:10),
                     Text('Enjoy Free Shipping promotion with minimum 2 times'),
                     
                    ],
                  ),
                )
              ),
              SizedBox(height:10),
                 Card(
                   elevation: 0.0,
                margin: EdgeInsets.only(left:10,right:10),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Return & Warranty",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                         
                          Text("7 Days Return",style: TextStyle(fontSize:14),),

                       ],
                     ),
                      
                       SizedBox(height:10),
                     Text('Enjoy Free Shipping promotion with minimum 2 times'),
                     
                    ],
                  ),
                )
              ),
          ],
        ));
  }
}
