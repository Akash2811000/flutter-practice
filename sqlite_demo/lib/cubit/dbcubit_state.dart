part of 'dbcubit_cubit.dart';

abstract class DbcubitState {
  const DbcubitState();
}

class DbcubitInitial extends DbcubitState {}

class DbSucess extends DbcubitState {
  final String msg;

  DbSucess(this.msg);
}

class DbFail extends DbcubitState {
  final String err;

  DbFail(this.err);
}
class DbModelGet extends DbcubitState{
  List<Model> model;
  DbModelGet(this.model);
}
