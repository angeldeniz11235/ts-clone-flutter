class Person {
  String? firstName;
  String? lastName;
  String? primaryEmail;
  String? secondaryEmail;
  String? cellPhone;
  String? secondaryPhone;
  String? gender;

  Person(
      {this.firstName,
      this.lastName,
      this.primaryEmail,
      this.secondaryEmail,
      this.cellPhone,
      this.secondaryPhone,
      this.gender});

  Person.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    primaryEmail = json['primaryEmail'];
    secondaryEmail = json['secondaryEmail'];
    cellPhone = json['cellPhone'];
    secondaryPhone = json['secondaryPhone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['primaryEmail'] = this.primaryEmail;
    data['secondaryEmail'] = this.secondaryEmail;
    data['cellPhone'] = this.cellPhone;
    data['secondaryPhone'] = this.secondaryPhone;
    return data;
  }
}
