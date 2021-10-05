import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_details_page.dart';
import 'package:flutter/widgets.dart';

class PlayerDetailRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => PlayerListPage();
  PlayerDetailRoutePath(Map<String, dynamic>? routeData)
      : super(routeData: routeData);
  @override
  String get location => "/player-detail";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child =>
      (args) => PlayerDetailsPage(
          teamMember: args?["teamMember"], playerId: args?["playerId"]);

  @override
  int get routeIndex => 2;
}
