import 'dart:math';
import 'dart:io' show Platform;
import 'package:apidemo/chg_pass.dart';
import 'package:apidemo/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  // late final AnimationController controller;
  double _height = 200;

  double _width = 200;

  Color _color = Colors.red;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            chgsize();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          )),
      body: SafeArea(
          child: Center(
        child: AnimatedContainer(
          height: _height,
          width: _width,
          color: _color,
          duration: Duration(milliseconds: 500),
          curve: Curves.slowMiddle,
        ),
      )),
    );
  }

  chgsize() {
    setState(() {
      _height = 300;
      _width = 300;
      _color = Colors.green;
      // _height = random.nextInt(300).toDouble();
      // _width = random.nextInt(300).toDouble();
      // _color = Color.fromRGBO(
      //     random.nextInt(128), random.nextInt(128), random.nextInt(128), 1);
    });
  }
}

class Pageanimate extends StatefulWidget {
  const Pageanimate({Key? key}) : super(key: key);

  @override
  State<Pageanimate> createState() => _PageanimateState();
}

class _PageanimateState extends State<Pageanimate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          Navigator.of(context).push(pagech());
        },
        child: Container(
          height: 50,
          width: 80,
          color: Colors.green,
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      )),
    );
  }

  pagech() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, child) => ChgPass(),
        transitionsBuilder: (context, animation, secondanimation, child) {
          var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: accelerateEasing));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}

class Heroanim extends StatefulWidget {
  const Heroanim({Key? key}) : super(key: key);

  @override
  State<Heroanim> createState() => _HeroanimState();
}

class _HeroanimState extends State<Heroanim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 300,
              child: Hero(
                  tag: "add",
                  child: Icon(
                    Icons.add,
                    size: 60,
                  ),
                  placeholderBuilder: (context, heroSize, child) {
                    return Container(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(
              height: 29,
            ),
          ],
        ),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
