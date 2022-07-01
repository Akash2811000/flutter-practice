import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:flutter/material.dart';
typedef UpdateDailog = Function(StudentModel s);
class AlertViewPage extends StatelessWidget {
  AlertViewPage(this._name,this._address,this.updateDailog);
  TextEditingController _name;
  TextEditingController _address;
  UpdateDailog updateDailog;
  @override
  Widget build(BuildContext context) {

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
            controller: _address,
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
                address: _address.text);
            updateDailog(s);

             Navigator.of(context).pop();
             _name.clear();
            _address.clear();
            // var snackBar = const SnackBar(
            //     content: Text("data inserted"));
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(snackBar);
          },
        )
      ],
    );
  }
}
