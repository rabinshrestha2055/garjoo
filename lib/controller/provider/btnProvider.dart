import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/models/btnNav.dart';
import 'package:garjoo/screens/home.dart';
import 'package:garjoo/screens/personPage.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  get getCurrentIndex => _currentIndex;
  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> _tabItems = [
  

  Home(),
    Scaffold(
      body: Container(
        child: Center(
          child: Text('Review'),
        ),
      ),
    ),
    Scaffold(
      body: Container(
        child: Center(
          child: Text('Cart'),
        ),
      ),
    ),
    Person()
  ];

  List<BtnNavModel> _btnNavList = [
    BtnNavModel(
      name: "Home",
      icon: Icon(Icons.home),
    ),
    BtnNavModel(
      name: "Review",
      icon: Icon(
        Icons.message_outlined,
      ),
    ),
    BtnNavModel(
      name: "Cart",
      icon: Icon(
        Icons.shopping_bag_outlined,
      ),
    ),
    BtnNavModel(
      name: "Person",
      icon: Icon(
        Icons.person_outlined,
      ),
    ),
  ];
  List<BtnNavModel> get getBottomNav => [..._btnNavList];
  List<Widget> get getTabItem => [..._tabItems];
}
