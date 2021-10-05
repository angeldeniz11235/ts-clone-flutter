import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/more_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MoreRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => PlayerListPage();

  @override
  String get location => "/more";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child => (args) => MorePage();

  @override
  // TODO: implement routeIndex
  int get routeIndex => 4;
}
