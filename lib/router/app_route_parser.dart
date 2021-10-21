import 'package:dev_jayhackett_blogdemo/router/paths.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/home_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/player_detail_route_path.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.tryParse(routeInformation.location as String);
    if (uri == null || uri.pathSegments.isEmpty) {
      print("no segments");

      return HomeRoutePath();
    }
    switch (uri.pathSegments[0]) {
      case Paths.homePath:
      case Paths.rootPath:
        return HomeRoutePath();
      case Paths.playerDetailsPath:
        return PlayerDetailRoutePath({"playerId": uri.pathSegments[1]});
      default:
        return HomeRoutePath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    return RouteInformation(location: configuration.location);
  }
}
