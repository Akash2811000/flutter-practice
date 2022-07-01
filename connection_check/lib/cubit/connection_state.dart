part of 'connection_cubit.dart';

@immutable
abstract class ConnectioncheckState {}

class ConnectionInitial extends ConnectioncheckState {}
class ConnectionSucess extends ConnectioncheckState {}
class ConnectionFail extends ConnectioncheckState {}
