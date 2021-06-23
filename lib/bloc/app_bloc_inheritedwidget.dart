import 'package:dev_jayhackett_blogdemo/models/app_data.dart';
import 'package:flutter/material.dart';

class AppBloc extends InheritedWidget {
  final Widget child;

  final AppData _appData = AppData();

  AppBloc({Key? key, required this.child}) : super(key: key, child: child);

  static AppBloc? of(BuildContext context) {
    var provider = context.dependOnInheritedWidgetOfExactType<AppBloc>();
    return provider;
  }

  String? get token => _appData.token;
  set token(String? value) => (String? value) {
        _appData.token = value;
      };
  Future<bool> authenticate(String username, String password) async {
    // implement logic to check username and password
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    });
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
