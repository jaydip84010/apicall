import 'dart:io';

import 'package:apidemo/apisimple.dart';
import 'package:apidemo/chg_pass.dart';
import 'package:apidemo/fetchapi.dart';
import 'package:apidemo/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'animationdemo.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlertDemo(),
    ),
  );
}

class ApiDemo extends StatefulWidget {
  const ApiDemo({Key? key}) : super(key: key);

  @override
  State<ApiDemo> createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController mobile = TextEditingController();
  bool visible = false;
  final form = GlobalKey<FormState>();

  File? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff28333f),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
            key: form,
            child: Center(
              child: Container(
                height: 900,
                width: MediaQuery.of(context).size.width / 1.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: photo != null
                            ? CircleAvatar(
                                radius: 40,
                                child: Image.file(
                                  photo!,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Text("Select image"),
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // camera();
                            },
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Text(
                                  'camera',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // gallery();
                            },
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Text(
                                  'gallery',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                textAlignVertical: TextAlignVertical.center,
                                validator: (name) {
                                  if (name!.isEmpty) {
                                    return "enter name";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: name,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: const Color(0xffffcd01f6))),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 10,
                                        bottom: 20),
                                    label: const Text(
                                      ' Name',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                      ),
                                    ),
                                    alignLabelWithHint: true,
                                    hintText: 'Name',
                                    hintStyle: const TextStyle(
                                        debugLabel: 'sks',
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                        height: 2.5),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textAlignVertical: TextAlignVertical.center,
                                controller: email,
                                validator: (email) {
                                  if (email!.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(email)) {
                                    return "enter Email";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Color(0xffffcd01f6))),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 10,
                                        bottom: 20),
                                    label: const Text(
                                      ' Email',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                      ),
                                    ),
                                    alignLabelWithHint: true,
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                        height: 2.5),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: visible ? false : true,
                                textAlignVertical: TextAlignVertical.center,
                                controller: password,
                                validator: (password) {
                                  if (password!.isEmpty ||
                                      password.length < 8) {
                                    return "enter password";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        visible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xffffcd01f6))),
                                    contentPadding: EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 10,
                                        bottom: 20),
                                    label: const Text(
                                      ' Password',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                      ),
                                    ),
                                    alignLabelWithHint: true,
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        debugLabel: 'sks',
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                        height: 2.5),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                textAlignVertical: TextAlignVertical.center,
                                controller: dob,
                                validator: (date) {
                                  if (date!.isEmpty ||
                                      date.length < 10 ||
                                      date.length > 10) {
                                    return "enter Date of Birth";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: Container(
                                        child: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: const Color(0xffffcd01f6))),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 10,
                                        bottom: 20),
                                    label: const Text(
                                      ' Date of Birth',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                      ),
                                    ),
                                    alignLabelWithHint: true,
                                    hintText: 'Date of Birth',
                                    hintStyle: TextStyle(
                                        debugLabel: 'sks',
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                        height: 2.5),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                textAlignVertical: TextAlignVertical.center,
                                controller: mobile,
                                validator: (mobile) {
                                  if (mobile!.isEmpty ||
                                      mobile.length < 10 ||
                                      mobile.length > 10) {
                                    return "enter mobile number";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    suffixIcon: Container(
                                        child: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: const Color(0xffffcd01f6))),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 10,
                                        bottom: 20),
                                    label: const Text(
                                      ' Mobile Number',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                      ),
                                    ),
                                    alignLabelWithHint: true,
                                    hintText: 'Mobile Numer',
                                    hintStyle: TextStyle(
                                        debugLabel: 'sks',
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff6e7784),
                                        height: 2.5),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  getdata();
                                },
                                child: Container(
                                  height: 60,
                                  width: 350,
                                  child: Center(
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.pinkAccent,
                                          Colors.deepPurpleAccent
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                  ),
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      )),
    );
  }

  Future<Model> getdata() async {
    Map<String, dynamic> tomap() {
      return {
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'dob': dob.text,
        'mobile': mobile.text
      };
    }

    final response = await http.post(
        Uri.parse('https://djohnsoft.xyz/timeline/public/api/signUp'),
        body: tomap());
    print(response.body);
    return Model.fromJson({});
  }

  camera() async {
    final picked = await ImagePicker().getImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        photo = File(picked.path) as File;
      });
    }
  }

  gallery() async {
    final picked = await ImagePicker().getImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        photo = File(picked.path) as File;
      });
    }
  }
}

class AlertDemo extends StatefulWidget {
  const AlertDemo({Key? key}) : super(key: key);

  @override
  State<AlertDemo> createState() => _AlertDemoState();
}

class _AlertDemoState extends State<AlertDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: InkWell(
          onTap: () {
            showalert();
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.green,
            child: Center(
              child: Text(
                'Show',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showalert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are You Sure ?'),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Text('yes'),
              ),
              ElevatedButton(onPressed: () {}, child: Text('no'))
            ],
          );
        });
  }
}
