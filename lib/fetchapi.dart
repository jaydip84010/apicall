import 'dart:convert';

import 'package:apidemo/chg_pass.dart';
import 'package:apidemo/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class FetchApi extends StatefulWidget {
  const FetchApi({Key? key}) : super(key: key);

  @override
  State<FetchApi> createState() => _FetchApiState();
}

class _FetchApiState extends State<FetchApi> {
  TextEditingController name = TextEditingController();

  // TextEditingController email = TextEditingController();
  final form = GlobalKey<FormState>();
  late Future<SharedPreferences> pref;
  String? data;
  bool? val;

  Future savedata() async {
    pref = SharedPreferences.getInstance();
    val = await pref.then((value) => value.setString('name', name.text));
  }

  getdata() async {
    pref = SharedPreferences.getInstance();
    String? value = await pref.then((value) => value.getString('name'));
    data = value;
    print(value);
  }

  deletedata() async {
    pref = SharedPreferences.getInstance();
    await pref.then((value) => value.remove('name'));
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 400,
            width: 400,
            child: Form(
              key: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.green))),
                    controller: name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //           borderSide: BorderSide(color: Colors.green))),
                  //   controller: email,
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          savedata();
                        },
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 120,
                            color: Colors.green,
                            child: Center(child: Text('save')),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          getdata();
                        },
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 120,
                            color: Colors.green,
                            child: Center(child: Text('get')),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          deletedata();
                        },
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 120,
                            color: Colors.green,
                            child: Center(child: Text('delete')),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (val == null) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ChgPass()));
                      }
                    },
                    child: Center(
                      child: Container(
                        height: 30,
                        width: 120,
                        color: Colors.green,
                        child: Center(child: Text('Navigate')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
