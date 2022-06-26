

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice1/cubit/switch_button_cubit.dart';
import 'package:practice1/pages/Switchbutton.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'switcbutton',
      routes: {'switcbutton': (context) => BlocProvider(
          create: (context) => SwitchButtonCubit(), child: SwitchButton()),}));
}


