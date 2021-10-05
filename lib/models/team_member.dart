import 'package:dev_jayhackett_blogdemo/models/person.dart';

class TeamMember extends Person {
  int? number;
  List<Guardian>? guardian;

  DateTime? birthDate;
  TeamMember();
  TeamMember.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.number = json["number"];
    this.firstName = json["firstName"] == null
        ? "firstName${this.number}"
        : json["firstName"];
    this.birthDate = DateTime.now();
    List<Guardian> guardians = [];
    if (json["guardian"] != null && json["guardian"]?.length > 0) {
      for (var item in json["guardian"]) {
        guardians.add(Guardian.fromJson(item));
      }
    }
    this.guardian = guardians;
  }
}

class Guardian extends Person {
  Guardian();
  Guardian.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
