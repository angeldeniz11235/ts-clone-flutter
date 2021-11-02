import 'dart:convert';

import 'package:dev_jayhackett_blogdemo/API/database/db_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Map<String, dynamic>> saveTeam(Map<String, dynamic> data) async {
  String result;

  Response response = await http.post(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/teams/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json'
    },
    body: json.encode(data),
  );
  result = (response.body);
  return json.decode(result);
}

Future<List<Map<String, dynamic>>> getPlayers() async {
  String result;
  List<Map<String, dynamic>> items = [];

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/players/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json'
    },
  );
  result = (response.body);
  (json.decode(result))?.forEach((element) {
    var item = (Map<String, dynamic>.from(element));
    items.add(item);
  });
  return items;
}