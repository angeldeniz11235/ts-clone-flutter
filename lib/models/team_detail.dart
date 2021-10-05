import 'package:dev_jayhackett_blogdemo/models/coach.dart';
import 'package:dev_jayhackett_blogdemo/models/team_member.dart';

class TeamDetail {
  String? name;
  String? mascot;
  List<Coach>? headCoach;
  List<Coach>? assistantCoach;
  List<TeamMember>? teamMembers;

  TeamDetail(
      {this.name,
      this.mascot,
      this.headCoach,
      this.assistantCoach,
      this.teamMembers});

  TeamDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mascot = json['mascot'];
    if (json['headCoach'] != null) {
      headCoach = [];
      json['headCoach'].forEach((v) {
        headCoach?.add(Coach.fromJson(v));
      });
    }
    if (json['assistantCoach'] != null) {
      assistantCoach = [];
      json['assistantCoach'].forEach((v) {
        assistantCoach?.add(Coach.fromJson(v));
      });
    }
    if (json['teamMembers'] != null) {
      teamMembers = [];
      json['teamMembers'].forEach((v) {
        teamMembers?.add(TeamMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mascot'] = this.mascot;
    if (this.headCoach != null) {
      data['headCoach'] = this.headCoach?.map((v) => v.toJson()).toList();
    }
    if (this.assistantCoach != null) {
      data['assistantCoach'] =
          this.assistantCoach?.map((v) => v.toJson()).toList();
    }
    if (this.teamMembers != null) {
      data['teamMembers'] = this.teamMembers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
