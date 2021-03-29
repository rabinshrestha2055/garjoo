import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/carouselProvider.dart';
import 'package:garjoo/controller/provider/userProvider.dart';
import 'package:garjoo/models/newarivalmodel.dart';
import 'package:provider/provider.dart';

class ViewMore extends StatefulWidget {
  ViewMore({Key key}) : super(key: key);

  @override
  _ViewMoreState createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(Icons.search),
              onTap: () {},
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              child: Icon(Icons.shopping_cart_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          ChangeNotifierProvider<CarouselProvider>(
            create: (context) => CarouselProvider(),
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Card(
                  borderOnForeground: true,
                  child: Consumer<CarouselProvider>(
                      builder: (context, value, child) {
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
                  })),
            ),
          ),
          ChangeNotifierProvider<UserDetailsProvider>(
            create: (context) => UserDetailsProvider(),
            child: Consumer<UserDetailsProvider>(
                builder: (context, value, child) => FutureBuilder(
                    future: value.getArrivals(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var response = snapshot.data as List<ArrivalModel>;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          itemCount: response.length,
                          itemBuilder: (context, index) => Card(
                            elevation: 0.4,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 8),
                                  child: Image.network(
                                   "https://api.garjoo.com" +  response[index].image,
                                    height: 120,
                                    width: 140,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                 
                                    SizedBox(height: 10),
                                    Text(
                                      response[index].title,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      response[index].price.toString(),
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 40,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(children: [
                                        Icon(Icons.star, size: 15),
                                        // Text(response[index].subtitle)
                                      ]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          },
        child: Icon(Icons.search,color: Colors.white,),
      ),
    );
  }
}
