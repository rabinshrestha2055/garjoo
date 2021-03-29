import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:garjoo/models/login.dart';

import 'package:garjoo/controller/provider/userProvider.dart';
import 'package:garjoo/screens/login.dart';
import 'package:garjoo/screens/signup.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';


class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  final _formkey = GlobalKey<FormState>();
  var email, fname, lname, password, confirmPassword;
  bool _isChecked = false;
  bool _isChecked1 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //  backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Form(

              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter First Name';
                              }
                            },
                            onChanged: (value) {
                              fname = value;
                            },
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                //  prefixIcon: Icon(Icons.person),
                                labelText: 'First Name')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Last Name';
                              }
                            },
                            onChanged: (value) {
                              lname = value;
                            },
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                //  prefixIcon: Icon(Icons.person),
                                labelText: 'Last Name')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter valid email';
                              }
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                //  prefixIcon: Icon(Icons.person),
                                labelText: 'Email')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter valid password';
                              }
                            },
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                //  prefixIcon: Icon(Icons.person),
                                labelText: 'Password')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Empty';
                              }
                              if (value != password) {
                                return 'No match';
                              }
                            },
                            onChanged: (value) {
                              confirmPassword = value;
                            },
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                //  prefixIcon: Icon(Icons.person),
                                labelText: 'Confirm Password')),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          height: 50,
                          width: 320,
                          child: ChangeNotifierProvider<UserDetailsProvider>(
                            create: (context) => UserDetailsProvider(),
                            child: Consumer<UserDetailsProvider>(
                              builder: (context, value, child) => RaisedButton(
                                  disabledColor: Colors.red[200],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: Colors.red[300],
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: _isChecked && _isChecked1
                                      ? () {
                                          if (_formkey.currentState
                                              .validate()) {
                                            var registerModel = UserModel(
                                                username: fname + " " + lname,
                                                email: email,
                                                password: password,
                                                confirmPassword:
                                                    confirmPassword,
                                                type: "customer");
                                            value
                                                .customerRegister(registerModel)
                                                .then((response) {
                                              if (response.statusCode == 200) {
                                                final snackbar = SnackBar(
                                                  content: Text(
                                                      'Register Sucessfull!'),
                                                );
                                                Scaffold.of(context)
                                                    .showSnackBar(snackbar);
                                              } else if (response.statusCode ==
                                                  422) {
                                                final snackbar = SnackBar(
                                                  content: Text(
                                                      'The email has already been taken.'),
                                                );
                                                Scaffold.of(context)
                                                    .showSnackBar(snackbar);
                                              } else {
                                                final snackbar = SnackBar(
                                                  content: Text(
                                                      'Register Unsucessfull!'),
                                                );
                                                Scaffold.of(context)
                                                    .showSnackBar(snackbar);
                                              }
                                            });
                                          }
                                        }
                                      : null),
                            ),
                          )),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              //  print(_isChecked);
                              _isChecked = value;
                              // print(_isChecked);
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: firstText(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked1,
                          onChanged: (bool value) {
                            setState(() {
                              //  print(_isChecked);
                              _isChecked1 = value;
                              // print(_isChecked);
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 9.0),
                        child: secondText(),
                      )
                    ],
                  ),
                  SizedBox(height: 15),

                    SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                    style: TextStyle(fontSize: 14)),
                InkWell(
                  child: Text(
                    'Login Now',
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Image.asset('asset/facebook.jpeg'), onPressed: () {}),
                IconButton(
                    icon: Image.asset('asset/google.png'), onPressed: () {}),
              ],
            ),
            SizedBox(height: 25),
                ],
              ),
            
          
          )  
      ],
         )
         )
          );
      
    
  }


  register(
      {String email,
      password,
      name,
      confirmPassword,
      type = "customer"}) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'type': type,
    };

    var jsonResponse = null;
    var response =
        await http.post("https://api.garjoo.com/api/register", body: data);
    jsonResponse = json.decode(response.body);


    var jsonData = jsonResponse['data'];
    print('jsonData');
    print('Response status: ${response.statusCode}');



  }
}



Widget firstText() {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'I have read and agreed to the ',

            style: TextStyle(fontSize: 12.5, color: Colors.black),
          ),
          Text(
            'User Agreement ',
            style: TextStyle(fontSize: 12.5, color: Colors.red),
          ),
          Text(
            'and',
            style: TextStyle(fontSize: 12.5, color: Colors.black),

          ),
        ],
      ),
      Center(
          child: Text("Privacy Policy.",

              style: TextStyle(fontSize: 12.5, color: Colors.red)))

    ],
  );
}

Widget secondText() {
  return Column(
    children: [
      Row(
        children: [
          Text(
            'I accept the ',
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Text(
            'Terms and Conditions ',

            style: TextStyle(fontSize: 12.5, color: Colors.red),
          ),
          Text(
            'and all information',
            style: TextStyle(fontSize: 12.5, color: Colors.black),

          ),
        ],
      ),
      Text(

        'provided by me is valid. If any misinformation is provided',
        style: TextStyle(fontSize: 12.5, color: Colors.black),

      ),
      Center(
          child: Text(
        "is provided then, I will be  liable .",
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ))
    ],
  );
}
