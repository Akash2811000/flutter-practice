import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'connection_state.dart';

// class ConnectionCubit extends Cubit<ConnectioncheckState> {
//   ConnectionCubit() : super(ConnectionInitial());
//   final Connectivity _connectivity = Connectivity();
//
//   String status = "not connected";
//   @override
//   // void initState() {
//   //   _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   //   super.initState();
//   // }
//   Future<void> updateConnectionStatus() async {
//     late ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//       if ((result == ConnectivityResult.mobile) ||
//           (result == ConnectivityResult.wifi)) {
//         emit(ConnectionSucess());
//       } else {
//         emit(ConnectionFail());
//       }
//     } on PlatformException catch (e) {
//       print(e.message);
//     }
//
//
//   }
//
// }

class ConnectionCubit extends Cubit<ConnectioncheckState> {

  Connectivity? _connectivity;

  ConnectionCubit() : super(ConnectionInitial()) {

    _connectivity = Connectivity();

    _connectivity!.onConnectivityChanged.listen(checkConnectivity);

  }



  checkConnectivity(ConnectivityResult result) {

    print("dss");

    if ((result == ConnectivityResult.mobile) ||

        (result == ConnectivityResult.wifi)) {

      emit(ConnectionSucess());

    } else {

      emit(ConnectionFail());

    }

  }

}
