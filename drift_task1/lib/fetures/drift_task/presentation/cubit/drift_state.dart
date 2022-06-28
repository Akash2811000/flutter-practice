part of 'drift_cubit.dart';

abstract class DriftState {}

class DriftInitial extends DriftState {}

class DriftSucess extends DriftState{

  final List<Audit> auditlist;

  DriftSucess({required this.auditlist});
}
class DriftFailure extends DriftState{}
