import 'package:api_dio_demo/fetures/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/pages/quaotes_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child : ElevatedButton(
                onPressed: (){
              //getHttp();
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuaotesPage()));
              context.read<BreakingBadCubit>().getQuotes();
            },child: Text("quots")))
    );
  }
}