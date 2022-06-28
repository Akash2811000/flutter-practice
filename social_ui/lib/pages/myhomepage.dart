import 'package:flutter/material.dart';
import 'dart:math' as math;
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(
            math.pi / 4,
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 3,
                color: Colors.amber,
              ),
            ),
            child: InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {},
              child: Center(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(
                    -math.pi / 4,
                  ),
                  child: Text(
                    "Click",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
