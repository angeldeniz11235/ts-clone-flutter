// To parse this JSON data, do
//
//     final league = leagueFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

League leagueFromJson(String str) => League.fromJson(json.decode(str));

String leagueToJson(League data) => json.encode(data.toJson());

class League {
  League({
    @required this.id,
    @required this.name,
    @required this.hqAddress,
    @required this.foundationDate,
    @required this.sport,
  });

  int? id;
  String? name;
  int? hqAddress;
  DateTime? foundationDate;
  String? sport;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["ID"],
        name: json["name"],
        hqAddress: json["hqAddress"],
        foundationDate: DateTime.parse(json["foundationDate"]),
        sport: json["sport"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "hqAddress": hqAddress,
        "foundationDate": foundationDate?.toIso8601String(),
        "sport": sport,
      };
}
