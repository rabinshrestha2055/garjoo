import 'package:flutter/material.dart';


class AdsModel{
   final String image;

  AdsModel({@required this.image});

static List<AdsModel> adsList = [

      AdsModel(image: 'asset/ads1.jpeg'),
      AdsModel(image: 'asset/ads2.jpeg'),
        AdsModel(image: 'asset/ads1.jpeg'),
      AdsModel(image: 'asset/ads2.jpeg'),
      
  ];
}