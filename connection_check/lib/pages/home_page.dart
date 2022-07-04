import 'package:connection_check/cubit/connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionCubit, ConnectioncheckState>(

      builder: (context, state) {
        if(state is ConnectionSucess){
          return connected();
        }else{
          return disconnected();
        }
      },
    );
  }
}

class connected extends StatelessWidget {
  const connected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("connected"),

      ),
    );
  }
}


class disconnected extends StatelessWidget {
  const disconnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("disconnected"),

      ),
    );
  }
}

