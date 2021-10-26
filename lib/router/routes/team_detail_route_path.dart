import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/team_detail_page.dart';
import 'package:flutter/widgets.dart';

class TeamDetailRoutePath extends AppRoutePath {
  // @override
  // Widget Function([Map<String, dynamic>? args]) get child => TeamListPage();
  TeamDetailRoutePath(Map<String, dynamic>? routeData)
      : super(routeData: routeData);
  @override
  String get location => "/team-detail";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child =>
      (args) => TeamDetailsPage(team: TeamDetail.fromJson(args?['team']));

  @override
  int get routeIndex => 2;
}
