import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';

import 'package:flutter/material.dart';

class QuaotesPage extends StatelessWidget {
  const QuaotesPage({Key? key, required this.quaotlist}) : super(key: key);

  final List<QuoteModel> quaotlist;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF3366FF),
                  Color(0xFF00CCFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
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
                         const Text("quoteid:",style: TextStyle(fontWeight: FontWeight.w900),),
                         const SizedBox(width: 10),
                         Text(quaotlist[index].quoteId.toString())
                       ],) ,
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("quote:",style: TextStyle(fontWeight: FontWeight.w900),),
                            const SizedBox(width: 10),
                            Expanded(child: Text(quaotlist[index].quote.toString(),)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("author:",style: TextStyle(fontWeight: FontWeight.w900),),
                            const SizedBox(width: 10),
                            Text(quaotlist[index].author.toString()),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text("series:",style: TextStyle(fontWeight: FontWeight.w900),),
                            const SizedBox(width: 10),
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
