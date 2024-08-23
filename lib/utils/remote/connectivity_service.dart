// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();
//
//   Future<bool> checkInternetConnection() async {
//     var connectivityResult = await _connectivity.checkConnectivity();
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Stream<List<ConnectivityResult>> get connectivityStream => _connectivity.onConnectivityChanged;
// }