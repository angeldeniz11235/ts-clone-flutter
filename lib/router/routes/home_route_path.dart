import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/home_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => PlayerListPage();
  @override
  // TODO: implement routeIndex
  int get routeIndex => 0;
  @override
  String get location => "/home";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child => (args) => HomePage();
}
