part of 'drift_cubit.dart';

@immutable
abstract class DriftState {}

class DriftInitial extends DriftState {}


class DriftSucess extends DriftState{}
class DriftFailure extends DriftState{}
