import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice1/cubit/switch_button_cubit.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isswitch = true;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<SwitchButtonCubit, SwitchButtonState>(
            builder: (context, state) {
              print(state);

              return Switch(
                onChanged: (value) {
                  if (value == true) {
                    print('this is value $value');
                  } else {
                    print('this is value $value');
                  }
                  //isswitch = value;
                  // whenever switch is on then pressed button it called on changed and value became FALSE
                  // whenever switch is off then pressed button it called on changed and value became TRUE

                  context.read<SwitchButtonCubit>().toggleSwitch(value);
                },
                value: state is SwitchButtonSucess ? state.value : false,
                //  value: isswitch ? true:false,
                activeColor: Colors.blue,
                activeTrackColor: Colors.grey,
                inactiveThumbColor: Colors.redAccent,
                inactiveTrackColor: Colors.grey,
              );
            },
          ),
          Text(
            'Hello',
            style: TextStyle(fontSize: 20),
          )
        ]),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final txtController = TextEditingController();
  String onchangeval = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                onChanged: (value) {
                  setState(() {
                    onchangeval = value;
                  });
                },
                controller: txtController),
            Text(
              onchangeval,
            ),
          ],
        ),
      ),
    );
  }
}