class TeamDetail {
  String? teamName;
  String? headCoach;

  TeamDetail({this.teamName, this.headCoach});

  TeamDetail.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    headCoach = json['headCoach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamName'] = this.teamName;
    data['headCoach'] = this.headCoach;
    return data;
  }
}
