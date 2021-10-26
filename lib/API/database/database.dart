import 'dart:convert';

import 'package:dev_jayhackett_blogdemo/API/database/db_config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> SaveTeam(Map<String, dynamic> data) {
  return http.post(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/teams/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: json.encode(data),
  );
}
