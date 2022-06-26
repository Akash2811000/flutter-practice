import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_button_state.dart';

class SwitchButtonCubit extends Cubit<SwitchButtonState> {
  SwitchButtonCubit() : super(SwitchButtonInitial());
  bool isSwitched = false;
  void toggleSwitch(bool value) {


     emit(SwitchButtonSucess(value));
  }
}
