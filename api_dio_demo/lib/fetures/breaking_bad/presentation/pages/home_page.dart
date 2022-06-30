import 'package:api_dio_demo/fetures/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/pages/loding_page.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/pages/no_data_found_page.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/pages/quaotes_page.dart';
import 'package:api_dio_demo/injection_contaner.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController id = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<BreakingBadCubit, BreakingBadState>(
          builder: (context, state) {
            if (state is serchActive) {
              return TextField(
                controller: id,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<BreakingBadCubit>().checkNumStr(value);
                    id.clear();
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Type in your text",
                    fillColor: Colors.white70),
              );
            }
            return Text('API Calling');
          },
        ),
        actions: [
          BlocBuilder<BreakingBadCubit, BreakingBadState>(
            builder: (context, state) {
              print(state);
              return Row(
                children: [
                  state is serchActive
                      ? IconButton(
                          onPressed: () {
                            print('close');
                            context.read<BreakingBadCubit>().serch(0);
                           context.read<BreakingBadCubit>().getQuotes();
                          },
                          icon: Icon(Icons.arrow_right_outlined))
                      : IconButton(
                          onPressed: () {
                            print('search');
                            print(state);
                            context.read<BreakingBadCubit>().serch(1);
                            if (id.text == "") {
                              // final snackBar =
                              // SnackBar(content: Text('Please Enter'));
                              //
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                            } else {
                              print(id.text);
                              context
                                  .read<BreakingBadCubit>()
                                  .checkNumStr(id.text);
                              id.clear();
                              print("after clicking $state");
                            }

                          },
                          icon: Icon(Icons.search_rounded)),
                ],
              );
            },
          ),
        ],
      ),
      body: Center(child: BlocBuilder<BreakingBadCubit, BreakingBadState>(
        builder: (context, state) {
          if (state is BreakingBadQuoteSuccess) {
            if(state.quotlist.isEmpty) {
              return NoDataFound();
            }else {
              return QuaotesPage(quaotlist: state.quotlist);
            }

          }

          if (state is BreakingBadQuoteLoader) {
            return Loading();
          }
          if (state is BreakingBadFail) {
            return NoDataFound();
          }
          if(state is serchActive){
            return NoDataFound();
          }else {
            return NoDataFound();
          }
          // return ElevatedButton(
          //     onPressed: () {
          //       context.read<BreakingBadCubit>().getQuotes();
          //     },
          //     child: Text("Quates"));
        },
      )),

      // body: Center(
      //   child: BlocConsumer<BreakingBadCubit, BreakingBadState>(
      //     listener: (context, state) {
      //       if (state is BreakingBadQuoteSuccess) {
      //         Navigator.of(context).push(MaterialPageRoute(
      //             builder: (context) =>
      //                 BlocProvider(
      //                   create: (context) => sl<BreakingBadCubit>(),
      //                   child: QuaotesPage(quaotlist: state.quotlist),
      //                 )));
      //       }
      //     },
      //     builder: (context, state) {
      //       if (state is BreakingBadQuoteLoader) {
      //         return Loading();
      //       }
      //       return ElevatedButton(
      //           onPressed: () {
      //             context.read<BreakingBadCubit>().getQuotes();
      //           },
      //           child: Text("Quates"));
      //     },
      //   ),
      // ),


      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          if(id.text.isEmpty) {
            context.read<BreakingBadCubit>().getQuoteByrandom();
          }
          else {
            context.read<BreakingBadCubit>().getQuotesSeriesByranom(id.text);
          }
        },
      ),

    );
  }
}
