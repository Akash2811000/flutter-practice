import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/cubit/stddata_cubit.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/pages/alert_dailog_page.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/pages/alert_insert_page.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/pages/no_data_found_page.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/pages/student_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              "get",
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () {
              context.read<StddataCubit>().getAllStudent();
            },
            style: TextButton.styleFrom(
                primary: Colors.deepPurpleAccent,
                elevation: 2,
                backgroundColor: Colors.blue),
          ),
        ],
      ),
      body: BlocBuilder<StddataCubit, StddataState>(
        builder: (context, state) {
          if(state is StddataSucess){
            if(state.studenlist.isEmpty){
              return NoDataFound();
            }
            return StudentListPage( studentlist: state.studenlist);
          }
          if(state is StddataLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return NoDataFound();
          }

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        // onPressed: () {
        //   context.read<StddataCubit>().getAllStudent();
        //   StudentModel s = StudentModel(name:"sky gupta",studentId: 37);
        //   //context.read<StddataCubit>().createstudent(s);
        // },
        onPressed: () {
          TextEditingController _name = TextEditingController();
          TextEditingController _id = TextEditingController();
          TextEditingController _address = TextEditingController();
          print('click');
          showDialog(
              context: context,
              builder: (BuildContext context2) {
                return AlertInsPage(_id, _name, _address, (id, name, address) {
                  StudentModel s = StudentModel(studentId:id , name: name, address: address );
                  context.read<StddataCubit>().createstudent(s);
                });
              });
        },
      ),

    );
  }
}
