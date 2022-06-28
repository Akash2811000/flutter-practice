import 'package:drift_task1/fetures/drift_task/data/data_sources/local/database/drift_database.dart';
import 'package:drift_task1/fetures/drift_task/presentation/cubit/drift_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      BlocBuilder<DriftCubit, DriftState>(
        builder: (context, state) {
          if(state is DriftSucess){
            return AuditDisplay(
                auditlist: state.auditlist
            );
          }else{
            return Center(
              child: Text("Nodate"),
            );
          }
        },
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('call');
            context.read<DriftCubit>().insertaudit();
          },
        )
    );
  }
}


class AuditDisplay extends StatelessWidget {
  const AuditDisplay({Key? key, required this.auditlist}) : super(key: key);
  final List<Audit>  auditlist;

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _date = TextEditingController();
   return ListView.builder(itemBuilder: ( context,index)
   {
     return Card(
       child: ListTile(
         title: Text(auditlist[index].auditEntityName.toString()),
         subtitle: Text(auditlist[index].entityEndDate.toString()),
         trailing: SizedBox(
           width: 100,
           child: Row(
             children: [
               IconButton(
                   onPressed: () {
                     _name.text = auditlist[index].auditEntityName.toString();
                     _date.text = auditlist[index].entityEndDate.toString();
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
                                   controller: _date,
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
                                   Audit a = Audit(
                                       auditEntityId: auditlist[index].auditEntityId,
                                       auditId: auditlist[index].auditId,
                                     auditEntityName: _name.text,
                                     auditEntityTypeId: auditlist[index].auditEntityTypeId,
                                     sequenceNo: auditlist[index].sequenceNo,
                                     entityEndDate: _date.text,
                                     isLeafNode: auditlist[index].isLeafNode,
                                     barcodeNFC: auditlist[index].barcodeNFC,
                                     entityLevel: auditlist[index].entityLevel,
                                     entityException: auditlist[index].entityException,
                                     scheduleOccurrenceIds: auditlist[index].scheduleOccurrenceIds,


                                   );
                                    context.read<DriftCubit>().updateaudit(a);
                                   Navigator.of(context).pop();
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
                         .deleteaudit(auditlist[index]);
                   },
                   icon: Icon(Icons.delete)),
             ],
           ),
         ),
       ),
     );
   },
   itemCount:auditlist.length);
  }
}
