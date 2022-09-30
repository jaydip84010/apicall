import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class ChgPass extends StatefulWidget {
  const ChgPass({Key? key}) : super(key: key);

  @override
  State<ChgPass> createState() => _ChgPassState();
}

class _ChgPassState extends State<ChgPass> {
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  bool visible = false;
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff28333f),
      body: SafeArea(
        child: Container(
          height: 500,
          width: 300,
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlignVertical: TextAlignVertical.center,
                    controller: oldpass,
                    validator: (old) {
                      if (old!.isEmpty) {
                        return "enter old-password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xffffcd01f6))),
                        contentPadding: const EdgeInsets.only(
                            left: 20, top: 20, right: 10, bottom: 20),
                        label: const Text(
                          ' Old password',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffff6e7784),
                          ),
                        ),
                        alignLabelWithHint: true,
                        hintText: 'Old password',
                        hintStyle: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffff6e7784),
                            height: 2.5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
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
                    controller: newpass,
                    validator: (newp) {
                      if (newp!.isEmpty || newp.length < 8) {
                        return "enter New password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            visible ? Icons.visibility_off : Icons.visibility,
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
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffffcd01f6))),
                        contentPadding: EdgeInsets.only(
                            left: 20, top: 20, right: 10, bottom: 20),
                        label: const Text(
                          ' New Password',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffff6e7784),
                          ),
                        ),
                        alignLabelWithHint: true,
                        hintText: 'New Password',
                        hintStyle: const TextStyle(
                            debugLabel: 'sks',
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffff6e7784),
                            height: 2.5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          'Submit',
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
        ),
      ),
    );
  }

  Future<Model> getdata() async {
    Map<String, dynamic> tomap() => {
          'userID': '1',
          'oldPassword': oldpass.text,
          'newPassword': newpass.text,
          'accessToken': 'https://djohnsoft.xyz/timeline/public/api'
        };
    final response = await http.post(
        Uri.parse('https://djohnsoft.xyz/timeline/public/api/changePassword'),
        body: tomap());
    print(response.body);
    return Model.fromJson({});
  }
}
