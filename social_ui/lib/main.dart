

import 'package:flutter/material.dart';
import 'package:social_ui/pages/myhomepage.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'Homepage',
    routes: {
      'Homepage' :(context) => MyHomePage()
    },
  ));
}

