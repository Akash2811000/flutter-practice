import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  void getHttp() async {
    try {
      print("hello");
      var response = await Dio().get('https://www.breakingbadapi.com/api/quotes');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child : ElevatedButton(onPressed: (){getHttp();},child: Text("quots")))
    );
  }
}
