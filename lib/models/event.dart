import 'address.dart';
import 'team_detail.dart';
import 'team_member.dart';

class Event {
  String? id;
  Address? address;
  String? eventDateTime;
  TeamDetail? opponent;
  List<TeamMember>? confirmedList;

  Event(
      {this.id,
      this.address,
      this.eventDateTime,
      this.opponent,
      this.confirmedList});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    eventDateTime = json['eventDateTime'];
    opponent = json['opponent'] != null
        ? new TeamDetail.fromJson(json['opponent'])
        : null;
    if (json['confirmedList'] != null) {
      confirmedList = [];
      json['confirmedList'].forEach((v) {
        confirmedList?.add(new TeamMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.address != null) {
      data['address'] = this.address?.toJson();
    }
    data['eventDateTime'] = this.eventDateTime;
    if (this.opponent != null) {
      data['opponent'] = this.opponent?.toJson();
    }
    if (this.confirmedList != null) {
      data['confirmedList'] =
          this.confirmedList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
