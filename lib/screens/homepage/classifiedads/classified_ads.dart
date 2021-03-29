import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/models/adsmodel.dart';

class ClassifedAds extends StatefulWidget {
  @override
  _ClassifedAdsState createState() => _ClassifedAdsState();
}

class _ClassifedAdsState extends State<ClassifedAds> {
   List<AdsModel> adsList = AdsModel.adsList;
  @override
  Widget build(BuildContext context) {
    return    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Classified Featured Ads',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Card(
                    borderOnForeground: true,
                    child: Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: Carousel(
                        boxFit: BoxFit.fill,
                        images: adsList
                            .map((eachItem) => AssetImage(eachItem.image))
                            .toList(),
                        dotBgColor: Colors.transparent,
                        autoplay: true,
                        animationDuration: Duration(milliseconds: 1000),
                        dotSize: 5.0,
                        indicatorBgPadding: 2.0,
                      ),
                    ))),]);
         
  }
}