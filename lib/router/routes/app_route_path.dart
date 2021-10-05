import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AppRoutePath {
  AppRoutePath({this.routeData});
  Key get valueKey;
  Map<String, dynamic>? routeData;
  Widget Function(Map<String, dynamic>? args) get child;
  String get location;
  int get routeIndex;
}
