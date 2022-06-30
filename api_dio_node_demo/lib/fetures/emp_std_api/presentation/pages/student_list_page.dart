import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:flutter/material.dart';
class StudentListPage extends StatelessWidget {
  const StudentListPage({Key? key, required this.studentlist}) : super(key: key);

  final List<StudentModel> studentlist;

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
            itemCount: studentlist.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Text("id:",style: TextStyle(fontWeight: FontWeight.w900),),
                        SizedBox(width: 10),
                        Text(studentlist[index].studentId.toString())
                      ],) ,
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("name:",style: TextStyle(fontWeight: FontWeight.w900),),
                          SizedBox(width: 10),
                          Expanded(child: Text(studentlist[index].name.toString(),)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Fees:",style: TextStyle(fontWeight: FontWeight.w900),),
                          SizedBox(width: 10),
                          Text(studentlist[index].fees.toString()),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Result:",style: TextStyle(fontWeight: FontWeight.w900),),
                          SizedBox(width: 10),
                          Text(studentlist[index].result.toString()),
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