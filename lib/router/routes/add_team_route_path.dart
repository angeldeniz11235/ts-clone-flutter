import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/add_team_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/category_items_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/category_list_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/home_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddTeamRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => PlayerListPage();
  AddTeamRoutePath(Map<String, dynamic>? routeData)
      : super(routeData: routeData);
  @override
  // TODO: implement routeIndex
  int get routeIndex => 2;
  @override
  String get location => "/addteam";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child =>
      (args) => AddTeamPage(args?["leagues"]);
}
