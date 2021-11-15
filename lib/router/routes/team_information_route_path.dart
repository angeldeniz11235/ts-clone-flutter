import 'dart:convert';

import 'package:dev_jayhackett_blogdemo/models/team_member.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/team_information_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TeamInformationRoutePath extends AppRoutePath {
  TeamInformationRoutePath(Map<String, dynamic>? routeData)
      : super(routeData: routeData);

  @override
  String get location => "/teaminformation";

  @override
  Key get valueKey => ValueKey(location);

  @override
  Widget Function(Map<String, dynamic>? args) get child =>
      (args) => TeamInformationPage(
            //convert json.decode(args?["data"]) to List<Map<String,dynamic>>
            data: (json.decode(args?["data"]) as List<dynamic>)
                .map((dynamic item) => TeamMember.fromJson(item))
                .toList(),
            teamID: args?["teamID"],
          );

  @override
  // TODO: implement routeIndex
  int get routeIndex => 2;
}
