import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuaotesPage extends StatelessWidget {
  const QuaotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 20, itemBuilder: (context, index) {
      return Card(
      child: Column(
        children: [
          Text("quoteId"),
          Text("quote"),
          Text("author"),
          Text("series"),
        ],
      ),
      );
    });
  }
}
