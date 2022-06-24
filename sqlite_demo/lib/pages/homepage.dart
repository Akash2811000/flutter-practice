import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/cubit/dbcubit_cubit.dart';
import 'package:sqlite_demo/model/model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _quantity = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text(
          "sqlite",
        ),
      ),
      body: BlocBuilder<DbcubitCubit, DbcubitState>(
        builder: (context, state) {
          if (state is DbSucess) {
            return FutureBuilder(
                future: context.read<DbcubitCubit>().getModellist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // print(snapshot);
                    List<Model> modelist = snapshot.data as List<Model>;
                    //print(modelist[0].fruitName);
                    return ListView.builder(
                        itemCount: modelist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(modelist[index].fruitName),
                              subtitle: Text(modelist[index].quantity),
                              trailing: SizedBox(
                                width: 100,
                                height: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          TextEditingController _nameu = TextEditingController();
                                          TextEditingController _quantityu = TextEditingController();
                                          _nameu.text =
                                              modelist[index].fruitName;
                                          _quantityu.text =
                                              modelist[index].quantity;
                                          showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      25.0))),
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context3) =>
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      12.0),
                                                          child: Text(
                                                              'Enter your data'),
                                                        ),
                                                        TextField(
                                                          controller: _nameu,
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      'Fruit name'),
                                                          autofocus: true,
                                                        ),
                                                        TextField(
                                                          controller: _quantityu,
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      'Quantity'),
                                                          autofocus: true,
                                                        ),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              Model model = Model(
                                                                  fruitName:
                                                                      _nameu
                                                                          .text,
                                                                  quantity:
                                                                      _quantityu
                                                                          .text);
                                                              context
                                                                  .read<
                                                                      DbcubitCubit>()
                                                                  .updateModel(
                                                                      model,
                                                                      modelist[
                                                                              index]
                                                                          .id);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                "update")),
                                                        const SizedBox(
                                                          height: 8.0,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom: MediaQuery
                                                                      .of(context3)
                                                                  .viewInsets
                                                                  .bottom),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                      ],
                                                    ),
                                                  )
                                          );
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<DbcubitCubit>()
                                              .deleteModel(modelist[index].id);
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return const CircularProgressIndicator();
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: const Icon(Icons.add),
          onPressed: () {
            print('click');
            showDialog(
                context: context,
                builder: (BuildContext context2) {
                  return AlertDialog(
                    title: const Text('TextField AlertDemo'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _name,
                          decoration: const InputDecoration(hintText: "Name"),
                        ),
                        TextField(
                          controller: _quantity,
                          decoration:
                              const InputDecoration(hintText: "Quantity"),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('SUBMIT'),
                        onPressed: () {
                          Model objModel = Model(
                              fruitName: _name.text, quantity: _quantity.text);
                          context.read<DbcubitCubit>().insertModel(objModel);
                          Navigator.of(context).pop();
                          _name.clear();
                          _quantity.clear();
                          var snackBar =
                              const SnackBar(content: Text("data inserted"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      )
                    ],
                  );
                });
          }),
    );
  }
}
