import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/carouselProvider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

class Carousel1 extends StatelessWidget {
  const Carousel1({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
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
            ))),);
  }
}
