// To parse this JSON data, do
//
//     final teamDetail = teamDetailFromJson(jsonString);

import 'dart:convert';

TeamDetail teamDetailFromJson(String str) =>
    TeamDetail.fromJson(json.decode(str));

String teamDetailToJson(TeamDetail data) => json.encode(data.toJson());

class TeamDetail {
  TeamDetail({
    this.id = 0,
    required this.league,
    required this.name,
    required this.hqAddress,
    required this.mascot,
  });

  int id;
  int league;
  String name;
  int hqAddress;
  dynamic mascot;

  factory TeamDetail.fromJson(Map<String, dynamic> json) => TeamDetail(
        id: json["ID"],
        league: json["league"],
        name: json["name"],
        hqAddress: json["hqAddress"],
        mascot: json["mascot"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "league": league,
        "name": name,
        "hqAddress": hqAddress,
        "mascot": mascot,
      };
}
