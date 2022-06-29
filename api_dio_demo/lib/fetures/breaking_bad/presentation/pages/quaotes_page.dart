import 'package:api_dio_demo/fetures/breaking_bad/data/model/QuoteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuaotesPage extends StatelessWidget {
  const QuaotesPage({Key? key, required this.quaotlist}) : super(key: key);

  final List<QuoteModel> quaotlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: quaotlist.length, itemBuilder: (context, index) {
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
    });
  }
}
