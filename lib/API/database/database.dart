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

Future<Map<String, dynamic>> getTeam(String id) async {
  String result;

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/teams/" +
        id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json'
    },
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

Future<List<Map<String, dynamic>>> getPersons() async {
  String result;
  List<Map<String, dynamic>> persons = [];

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/persons"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json'
    },
  );
  result = (response.body);
  (json.decode(result))?.forEach((element) {
    var person = (Map<String, dynamic>.from(element));
    persons.add(person);
  });
  return persons;
}

//update teamMember in database using id
Future<Map<String, dynamic>> updateTeamMember(
    Map<String, dynamic> data, String id) async {
  String result;

  Response response = await http.put(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/players/" +
        id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json'
    },
    body: json.encode(data),
  );
  result = (response.body);
  return json.decode(result);
}

//get all teammembers from database for a team
Future<List<Map<String, dynamic>>> getTeamMembers(String teamID) async {
  String result;
  List<Map<String, dynamic>> items = [];

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/teams/get-all-players/" +
        teamID),
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

//get all team members pesonal info from all members in a team using team id
Future<List<Map<String, dynamic>>> getTeamMembersPersonalInfo(
    String teamID) async {
  String result;
  List<Map<String, dynamic>> items = [];

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/teams/get-all-players-info/" +
        teamID),
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

//get one person from database using id
Future<Map<String, dynamic>> getPerson(String id) async {
  String result;

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/persons/" +
        id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json'
    },
  );
  result = (response.body);
  return json.decode(result);
}

//get all leagues from database
Future<List<Map<String, dynamic>>> getLeagues() async {
  String result;
  List<Map<String, dynamic>> items = [];

  Response response = await http.get(
    Uri.parse("http://" +
        DBconfig.get_API_IP() +
        ":" +
        DBconfig.get_API_PORT() +
        "/api/v1/leagues/"),
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
