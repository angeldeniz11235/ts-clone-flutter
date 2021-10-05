import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RosterRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => PlayerListPage();
  @override
  // TODO: implement routeIndex
  int get routeIndex => 2;
  @override
  String get location => "/rosters";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child =>
      (args) => PlayerListPage();
}
