part of 'stddata_cubit.dart';

@immutable
abstract class StddataState {}

class StddataInitial extends StddataState {}
class StddataSucess extends StddataState {
  final List<StudentModel> studenlist;

  StddataSucess(this.studenlist);
}
class StddataFail extends StddataState {}
