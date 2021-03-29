import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:garjoo/screens/login.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'home.dart';
// import 'package:file_picker_example/src/file_picker_demo.dart';
// import 'package:flutter/widgets.dart';

class Seller extends StatefulWidget {
  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  bool _isChecked = false;
  bool _isChecked1 = false;

  var email,confirmpassword,cname,cemail,cphone,fname,lname,ctycode;
 var fileName;
  var password;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

   @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

 void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //  backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                   padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid name';
                          }
                        },
                        onChanged: (value) {
                          fname = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            
                            labelText: 'First Name')),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                     padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid name';
                          }
                        },
                        onChanged: (value) {
                          lname = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                           
                            labelText: 'Last Name')),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
               Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                     padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid name';
                          }
                        },
                        onChanged: (value) {
                          cname = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                           
                            labelText: 'Company Name')),
                  ),
                ),
                 SizedBox(
                  height: 5,
                ),
                  Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                     padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid name';
                          }
                        },
                        onChanged: (value) {
                          cemail = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                           
                            labelText: 'Company Email')),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 8),
                            child:  Container(
                                  padding: const EdgeInsets.only(left:8,bottom: 0.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.60,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:10),
                                    child: ListView.builder(
                                      itemCount:
                                      _paths != null && _paths.isNotEmpty
                                          ? _paths.length
                                          : 1,
                                      itemBuilder:
                                      (BuildContext context, int index) {
                                    final bool isMultiPath =
                                        _paths != null && _paths.isNotEmpty;
                                    fileName = 
                                        (isMultiPath
                                            ? _paths
                                                .map((e) => e.path)
                                                .toList()[index]
                                            : _fileName ?? '...');
                                

                                    return Text(
                                        fileName,
                                     style: TextStyle(color: Colors.grey[700],fontSize: 15.5), 
                                     
                                    );
                                      },
                                      
                                    ),
                                  ),
                                )
                            
                ),
                          ),
                        ),
                      
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            border: Border.all(color: Colors.black26)),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>FilePicker1()),);
                            _openFileExplorer();
                          },
                          child: Center(child: Text('Browse',style: TextStyle(color:Colors.white),))),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Card(
                    elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: IntlPhoneField(
                      controller: _controller,
                      onChanged: (value) {
                        cphone=value.number;
                        ctycode=value.countryCode;
                      
                      },
                      initialCountryCode: 'NP',
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                     focusedBorder: InputBorder.none,
                        labelText: 'Phone number', ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                  Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                     padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
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
                           
                            labelText: 'Email')),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                  Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                     padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
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
                           
                            labelText: 'Password')),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                  Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  elevation: 3,
                  child: Padding(
                     padding:  EdgeInsets.only(left:12.0,top:6,bottom:6),
                    child: TextFormField(

                        // keyboardType: TextInputType.text,
                        // controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid password';
                          }
                        },
                        onChanged: (value) {
                          confirmpassword = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                           
                            labelText: 'Confirm Password')),
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
                      child: RaisedButton(
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
                                  // print(cphone);
                               sellerRegister(
                                          name: fname + lname,
                                          email: email,
                                          password: password,
                                           cemail: cemail,
                                           cname: cname,
                                           phone: ctycode+ cphone,
                                         confirmpassword: confirmpassword,
                                         fileName: fileName
                                         );
                               
                                 }
                              : null),
                    ),
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
              ],
            ),
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
            SizedBox(height: 17),
          ],
        ),
      ),
    );
  }
  sellerRegister ({String name, password,type='seller',confirmpassword,cname,cemail,phone,email,fileName}) async {
  var url="https://api.garjoo.com/api/register";
  var request = http.MultipartRequest('POST', Uri.parse(url));
   Map data = {
      'name':name,
      'email': email,
      'password': password,
      'password_confirmation':confirmpassword,
      'type':type,
      'company_email':cemail,
      'company_name':cname,
      'company_phone':phone,
      
    };
    //request.fields.addAll()
    // request.fields.entries;
    // request.fields.map((key, value) => null)
    
  //request.fields.addAll(data);
  data.forEach((key, value) { 
    request.fields[key] = value;
  });
  request.files.add(
    http.MultipartFile(
      'document',
      File(fileName).readAsBytes().asStream(),
      File(fileName).lengthSync(),
      filename: fileName.split("/").last
    )
  );
  // print(request);
  var res = await request.send();
  print(res.statusCode);
  print(res.stream);
}

    register({String name, password,type='seller',confirmpassword,cname,cemail,phone,email,fileName}) async {
 
    Map data = {
      'name':name,
      'email': email,
      'password': password,
      'password_confirmation':confirmpassword,
      'type':type,
      'company_email':cemail,
      'company_name':cname,
      'company_phone':phone,
      'document':fileName,
    };
    var jsonResponse = null;
    var response =
        await http.post("https://api.garjoo.com/api/register", body: data);
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
   // var jsonData = jsonResponse['data'];
  //  print(jsonData);
    print('Response status: ${response.statusCode}');
    // print('Response body:${response.body}');

    if (jsonResponse != null) {
      // sharedPreferences.setString("Name", jsonData["name"]);
      // sharedPreferences.setString("Email", jsonData["email"]);
      // sharedPreferences.setString("Token", jsonResponse["token"]);
      // sharedPreferences.setString("Type", jsonData["type"]);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home()));
    } else {
      //  print(response.body);
    }
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
            style: TextStyle(fontSize: 12.5, color: Colors.black),
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
        "then, I will be  liable .",
        style: TextStyle(fontSize: 12.5, color: Colors.black),
      ))
    ],
  );
}