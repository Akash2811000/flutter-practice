import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuaotesPage extends StatelessWidget {
  const QuaotesPage({Key? key, required this.quaotlist}) : super(key: key);

  final List<QuoteModel> quaotlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<BreakingBadCubit,BreakingBadState>(
          builder: (context,state){
            if(state is serchActive){
              return Text('API Calling');
            }
            return TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  //filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Type in your text",
                  fillColor: Colors.white70),
            );
          },
        ),
        actions: [
          BlocBuilder<BreakingBadCubit, BreakingBadState>(
            builder: (context, state) {
              return Row(
                children: [
                  state is serchActive ?
                  IconButton(onPressed: () {
                    print('search');
                    context.read<BreakingBadCubit>().serch(1);
                  }, icon: Icon(Icons.search_rounded)) :
                  IconButton(onPressed: () {
                    print('close');
                    context.read<BreakingBadCubit>().serch(0);
                  }, icon: Icon(Icons.close)),
                ],
              );
            },
          ),
        ],
      ),

      body: ListView.builder(itemCount: quaotlist.length, itemBuilder: (context, index) {
        return Card(
        child: Column(
          children: [
            Text(quaotlist[index].quoteId.toString()),
            Text(quaotlist[index].quote.toString()),
            Text(quaotlist[index].author.toString()),
            Text(quaotlist[index].series.toString()),

          ],
        ),
        );
      }),
    );
  }
}
