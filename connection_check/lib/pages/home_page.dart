import 'package:connection_check/cubit/connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
          BlocListener<ConnectionCubit, ConnectioncheckState>(
            listener: (context, state) {
              print(state);
              if(state is ConnectionSucess){
                Scaffold.of(context).showSnackBar(SnackBar( content: Text('Connected!!! :)'),));
              }
              if(state is ConnectionFail){
                Scaffold.of(context).showSnackBar(SnackBar( content: Text('Data is Not Connected!!! :('),));
              }
            },
            child: ElevatedButton(onPressed: (){},child: Text("hello"),),
      ),
      )
    );
  }
}