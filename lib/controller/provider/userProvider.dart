import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:garjoo/controller/provider/appurl.dart';
import 'package:garjoo/models/newarivalmodel.dart';
import 'package:garjoo/models/categorymodel.dart';
import 'package:garjoo/models/discountmodel.dart';
import 'package:garjoo/models/featured_cat_model.dart';
import 'package:garjoo/models/featuredproductmodel.dart';
import 'package:garjoo/models/womenfashionmodel.dart';
import 'package:garjoo/models/login.dart';
import 'package:garjoo/models/menfashionmodel.dart';
import 'package:http/http.dart' as http;

class UserDetailsProvider with ChangeNotifier {
  Future<List<ArrivalModel>> getArrivals() async {
    try {
      final response = await http.get(
        AppURl.arrival,
        headers: {
          "Accept": "application/json",
        },
      );
      return arrivalModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<DiscountModel>> getDiscount() async {
    try {
      final response = await http.get(
        AppURl.discount,
        headers: {
          "Accept": "application/json",
        },
      );

      return discountModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<FeaturedCatModel>> getFCategory() async {
    try {
      final response = await http.get(
        AppURl.fcategory,
        headers: {
          "Accept": "application/json",
        },
      );
   
      return featuredCategoryModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<FeaturedProductModel>> getFProduct() async {
    try {
      final response = await http.get(
        AppURl.fproducts,
        headers: {
          "Accept": "application/json",
        },
      );
   
      return featuredProductModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<MenFashionModel>> getMenProduct() async {
   
      final response = await http.get(
        AppURl.menfashion,
        headers: {
          "Accept": "application/json",
        },
      );
     
     
      return menFashionModelFromJson(response.body);
   
    }
  

    Future<List<WomenFashionModel>> getWomenProduct() async {
    
      final response = await http.get(
        AppURl.womenfashion,
        headers: {
          "Accept": "application/json",
        },
      );
    
      
    
      return womenFashionModelFromJson(response.body);
   
  }



  Future<http.Response> login(UserModel loginModel) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        AppURl.login,
        headers: headers,
        body: userModelToJson(loginModel),
      );
      return response;
    } catch (e) {}
  }

  Future<http.Response> customerRegister(UserModel registerModel) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        AppURl.register,
        headers: headers,
        body: userModelToJson(registerModel),
      );
      return response;
    } catch (e) {}
  }

  Future<http.StreamedResponse> sellerRegister(
    String filename,
    UserModel registerModel,
  ) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(AppURl.register));
      var data = registerModel.tojson();
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      request.files.add(http.MultipartFile(
        'document',
        File(filename).readAsBytes().asStream(),
        File(filename).lengthSync(),
        filename: filename.split("/").last,
      ));
      var res = await request.send();
      return res;
    } catch (e) {}
  }
}
