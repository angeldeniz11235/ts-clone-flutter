// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.address,
    @required this.phone,
    @required this.dateOfBirth,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? address;
  String? phone;
  DateTime? dateOfBirth;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["ID"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address,
        "phone": phone,
        "dateOfBirth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
      };
}
