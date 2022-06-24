import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          "sqlite",
        ),
      ),
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          onPressed: () {
            print('click');
            DialogBox();
          }),
    );
  }
}

class DialogBox {
  Widget? dailog (BuildContext context){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Show Alert Dialog Box"),
        content: Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }
}
//
// class DialogBox extends StatelessWidget {
//   const DialogBox({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text("Show Alert Dialog Box"),
//         content: Text("You have raised a Alert Dialog Box"),
//         actions: <Widget>[
//           FlatButton(
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//             child: Text("Ok"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
