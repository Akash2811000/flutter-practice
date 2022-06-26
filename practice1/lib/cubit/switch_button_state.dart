part of 'switch_button_cubit.dart';

@immutable
abstract class SwitchButtonState {}

class SwitchButtonInitial extends SwitchButtonState {}


// class SwitchButtonSucess<T> extends SwitchButtonState{
//   T response;
//   SwitchButtonSucess(this.response);
// }


class SwitchButtonSucess extends SwitchButtonState{
  bool value;
  SwitchButtonSucess(this.value);


}

class SwitchButtonunSucess extends SwitchButtonState{
  bool value;
  SwitchButtonunSucess(this.value);
}