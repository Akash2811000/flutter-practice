import 'package:drift_demo/cubit/drift_cubit.dart';
import 'package:drift_demo/database/drift_database.dart';
import 'package:drift_demo/model/employeemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomepage extends StatelessWidget {
  //const MyHomepage({Key? key}) : super(key: key);
  late List<Employee> modelList;

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _salary = TextEditingController();
    return Scaffold(
      body: BlocBuilder<DriftCubit, DriftState>(
        builder: (context, state) {
          return FutureBuilder<List<Employee>>(
              future: context.read<DriftCubit>().getData(),
              builder: (context, s) {
                if (s.hasData) {
                  modelList = s.data as List<Employee>;
                  return ListView.builder(
                      itemCount: modelList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          )),
                          title: Text(modelList[index].employeeName.toString()),
                          subtitle:
                              Text(modelList[index].employeeSalary.toString()),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _name.text = modelList[index].employeeName.toString();
                                      _salary.text = modelList[index].employeeSalary.toString();
                                      print('click');
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context2) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'TextField AlertDemo'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: _name,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: "Name"),
                                                  ),
                                                  TextField(
                                                    controller: _salary,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Quantity"),
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  child: const Text('SUBMIT'),
                                                  onPressed: () {
                                                    Employee e = Employee(employeeId: modelList[index].employeeId,employeeName: _name.text ,
                                                        employeeJoiningDate: modelList[index].employeeJoiningDate , employeeSalary: int.parse(_salary.text) );
                                                  context.read<DriftCubit>().updateEmployeeEntities(e);

                                                    Navigator.of(context).pop();
                                                    _name.clear();
                                                    _salary.clear();
                                                    var snackBar = const SnackBar(
                                                        content: Text(
                                                            "data inserted"));
                                                    ScaffoldMessenger.of(
                                                            context)
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
                                      context
                                          .read<DriftCubit>()
                                          .deletedata(modelList[index]);
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        ));
                      });
                } else {
                  return const Center(
                    child: Text("No data available"),
                  );
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('call');
          context.read<DriftCubit>().addEmployeeEntities();
        },
      ),
    );
  }
}
