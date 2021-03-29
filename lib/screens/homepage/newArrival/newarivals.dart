import 'package:flutter/material.dart';
import 'package:garjoo/controller/provider/userProvider.dart';
import 'package:garjoo/models/newarivalmodel.dart';
import 'package:garjoo/screens/homepage/navigate/navigate.dart';
import 'package:garjoo/screens/homepage/newArrival/view.dart';
import 'package:provider/provider.dart';

class Arrival extends StatelessWidget {
  const Arrival({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'New Arivals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 180),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewMore()),
                );
              },
              child: Text(
                'View More',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 10),
      ChangeNotifierProvider(
        create: (context) => UserDetailsProvider(),
        child: Consumer<UserDetailsProvider>(
          builder: (context, value, child) => FutureBuilder(
              future: value.getArrivals(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var response = snapshot.data as List<ArrivalModel>;

                  return Container(
                    margin: EdgeInsets.only(left:5,right:5),
                    child: GridView.builder(
                      shrinkWrap: true,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 4.6,
                        ),
                        physics: ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        itemCount: 6,
                        itemBuilder: (context, index) => 
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Navigate()),);
                          },
                                                  child: Container(
                                  child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 4),
                                        child: Image.network(
                                            "https://api.garjoo.com" +
                                                response[index].image,
                                            width: 97.3,
                                            height: 120)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 0),
                                      child: Text(
                                        response[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "Add to cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        )
                            ),
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      SizedBox(height: 10),
    ]);
  }
}
