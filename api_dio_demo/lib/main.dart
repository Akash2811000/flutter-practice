
import 'dart:io';

import 'package:api_dio_demo/fetures/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'injection_contaner.dart' as di;
import 'injection_contaner.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => sl<BreakingBadCubit>(),
         child: MyHomePage(),

      ),
    );
  }
}

