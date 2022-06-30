import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/cubit/stddata_cubit.dart';
import 'package:api_dio_node_demo/fetures/emp_std_api/presentation/pages/student_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StddataCubit, StddataState>(
        builder: (context, state) {
          if(state is StddataSucess){
            return StudentListPage( studentlist: state.studenlist);
          }else{
            return CircularProgressIndicator();
          }

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          //context.read<StddataCubit>().getAllStudent();
          StudentModel s = StudentModel(name:"sky gupta",studentId: 37);
          context.read<StddataCubit>().createstudent(s);
        },
      ),

    );
  }
}
