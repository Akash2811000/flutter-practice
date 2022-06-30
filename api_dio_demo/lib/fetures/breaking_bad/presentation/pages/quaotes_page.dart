import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:api_dio_demo/fetures/breaking_bad/domain/use_cases/get_quote_byid_usecase.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:api_dio_demo/fetures/breaking_bad/presentation/pages/loding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuaotesPage extends StatelessWidget {
  const QuaotesPage({Key? key, required this.quaotlist}) : super(key: key);

  final List<QuoteModel> quaotlist;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),

          child: ListView.builder(
              itemCount: quaotlist.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                       Row(children: [
                         Text("quoteid:",style: TextStyle(fontWeight: FontWeight.w900),),
                         SizedBox(width: 10),
                         Text(quaotlist[index].quoteId.toString())
                       ],) ,
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("quote:",style: TextStyle(fontWeight: FontWeight.w900),),
                            SizedBox(width: 10),
                            Expanded(child: Text(quaotlist[index].quote.toString(),)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("author:",style: TextStyle(fontWeight: FontWeight.w900),),
                            SizedBox(width: 10),
                            Text(quaotlist[index].author.toString()),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("series:",style: TextStyle(fontWeight: FontWeight.w900),),
                            SizedBox(width: 10),
                            Text(quaotlist[index].series.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),


    );
  }
}
