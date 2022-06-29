part of 'breaking_bad_cubit.dart';

@immutable
abstract class BreakingBadState {}

class BreakingBadInitial extends BreakingBadState {}

class BreakingBadQuoteSuccess extends BreakingBadState {
  final List<QuoteModel> quotlist;

  BreakingBadQuoteSuccess(this.quotlist);
}

class BreakingBadFail extends BreakingBadState {}

class BreakingBadQuoteLoader extends BreakingBadState {}

class serchActive extends BreakingBadState{}

class serchInActive extends BreakingBadState{}