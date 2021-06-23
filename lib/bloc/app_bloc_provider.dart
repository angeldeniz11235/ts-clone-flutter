import 'package:dev_jayhackett_blogdemo/models/app_data.dart';

class AppBloc {
  AppData? _appData;
  String? get token => _appData?.token;
  set token(String? value) => (String? value) {
        _appData?.token = value;
      };
  Future<bool> authenticate(String username, String password) async {
    // implement logic to check username and password
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    });
  }
}
