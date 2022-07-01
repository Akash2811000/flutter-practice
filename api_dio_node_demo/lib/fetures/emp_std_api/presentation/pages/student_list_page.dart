import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/cubit/stddata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({Key? key, required this.studentlist})
      : super(key: key);

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
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "id:",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                SizedBox(width: 10),
                                Text(studentlist[index].studentId.toString())
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "name:",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                    child: Text(
                                  studentlist[index].name.toString(),
                                )),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Address:",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                SizedBox(width: 10),
                                Text(studentlist[index].address.toString()),
                              ],
                            ),
                            // SizedBox(height: 10),
                            // Row(
                            //   children: [
                            //     Text("Result:",style: TextStyle(fontWeight: FontWeight.w900),),
                            //     SizedBox(width: 10),
                            //     Text(studentlist[index].result.toString()),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            TextEditingController _name =
                                TextEditingController();
                            TextEditingController _id = TextEditingController();
                            _name.text = studentlist[index].name.toString();
                            _id.text = studentlist[index].address.toString();
                            print('click');
                            showDialog(
                                context: context,
                                builder: (BuildContext context2) {
                                  return AlertDialog(
                                    title: const Text('Update data'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _name,
                                          decoration: const InputDecoration(
                                              hintText: "Name"),
                                        ),
                                        TextField(
                                          controller: _id,
                                          decoration: const InputDecoration(
                                              hintText: "address"),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text('SUBMIT'),
                                        onPressed: () {
                                          StudentModel s = StudentModel(
                                              name: _name.text,
                                              address: _id.text);
                                          context
                                              .read<StddataCubit>()
                                              .updateStudent(
                                                  s,
                                                  int.parse(studentlist[index]
                                                      .studentId
                                                      .toString()));

                                          Navigator.of(context).pop();
                                          _name.clear();
                                          _id.clear();
                                          var snackBar = const SnackBar(
                                              content: Text("data inserted"));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            context.read<StddataCubit>().deletestudent(
                                int.parse(
                                    studentlist[index].studentId.toString()));
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
