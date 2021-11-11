// To parse this JSON data, do
//
//     final teamMember = teamMemberFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TeamMember teamMemberFromJson(String str) =>
    TeamMember.fromJson(json.decode(str));

String teamMemberToJson(TeamMember data) => json.encode(data.toJson());

class TeamMember {
  TeamMember({
    @required this.id,
    @required this.personalInfo,
    @required this.team,
    @required this.position,
    @required this.guardian1,
    @required this.guardian2,
  });

  int? id;
  int? personalInfo;
  int? team;
  String? position;
  int? guardian1;
  int? guardian2;

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        id: json["ID"],
        personalInfo: json["personalInfo"],
        team: json["team"],
        position: json["position"],
        guardian1: json["guardian1"],
        guardian2: json["guardian2"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "personalInfo": personalInfo,
        "team": team,
        "position": position,
        "guardian1": guardian1,
        "guardian2": guardian2,
      };
}
