import 'package:flutter/material.dart';

import 'loginScreen.dart';

class Person extends StatelessWidget {
  const Person({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 500,
        height: 100,
        child: Center(
          child: RaisedButton(
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (builder) => LoginScreen()));
            },
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
