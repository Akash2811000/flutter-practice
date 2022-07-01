import 'package:api_dio_node_demo/fetures/emp_std_api/data/remote/models/StudentModel.dart';
import 'package:flutter/material.dart';
typedef InsertDailog = Function(int id,String name,String address);
class AlertInsPage extends StatelessWidget {
  AlertInsPage(this._id,this._name,this._address,this.updateDailog);
  TextEditingController _name;
  TextEditingController _id;
  TextEditingController _address;
  InsertDailog updateDailog;
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text('Update data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _id,
            decoration: const InputDecoration(
                hintText: "Studentid"),
          ),
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
                studentId: int.parse(_id.text),
                name: _name.text,
                address: _id.text);
            updateDailog(int.parse(_id.text),_name.text,_address.text);

            Navigator.of(context).pop();
            _name.clear();
            _id.clear();
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
