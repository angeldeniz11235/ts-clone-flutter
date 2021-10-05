import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/messages_page.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessagesRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => PlayerListPage();
  @override
  int get routeIndex => 3;
  @override
  String get location => "/messages";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child =>
      (args) => MessagesPage();
}
