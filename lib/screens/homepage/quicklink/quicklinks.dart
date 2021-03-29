import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garjoo/controller/provider/quicklinkProvider.dart';

import 'package:provider/provider.dart';

class QuickLink extends StatelessWidget {
  const QuickLink({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>QuickLinkProvider(),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 18, top: 10),
        child: Text(
          'Quick Links',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 15),
      Container(
        margin: EdgeInsets.only(left: 15, right: 15),
      
      
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 0,
            crossAxisCount: 4,
            childAspectRatio: 3 / 2.6,
          ),
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          itemCount: 8,
          itemBuilder: (context, index) => Container(
            height: 90,
            width: 82,
            child: Consumer<QuickLinkProvider>(builder: (context,value,child){
              return Card(
              child: Column(
                children: [
                  SvgPicture.asset(
                    value.getQuick[index].image,
                    width: 30,
                    height: 30,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10),
                  Text(value.getQuick[index].name)
                ],
              ),
            );
            }))
          ),
        ),
           SizedBox(height: 15),
     ] ),
   
    );
  }
  }

