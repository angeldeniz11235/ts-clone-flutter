import 'package:dev_jayhackett_blogdemo/API/database/database.dart';
import 'package:dev_jayhackett_blogdemo/models/person.dart';
import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:dev_jayhackett_blogdemo/models/team_member.dart';
import 'package:flutter/material.dart';

class TeamInformationPage extends StatefulWidget {
  final int? teamID;
  final List<TeamMember>? data;
  TeamInformationPage({Key? key, this.teamID, this.data}) : super(key: key);

  @override
  _TeamInfomationPageState createState() => _TeamInfomationPageState();
}

class _TeamInfomationPageState extends State<TeamInformationPage> {
  String name = "";

  // late Future<List<Map<String, dynamic>>> teamMemberPersonalInfo;
  String teamID = "";
  @override
  initState() {
    super.initState();
    if (widget.teamID != null) {
      teamID = widget.teamID.toString();
      teamID.toString();
    }
  }

  Future<List<Map<String, dynamic>>> getTeamMembersFromDB() async {
    return await getTeamMembersPersonalInfo(teamID);

    // late List<Map<String, dynamic>> teamMembersResult=[];
    // List<Map<String, dynamic>> teamMemberList = await getTeamMembers(teamID);

    // teamMemberList.forEach((teamMember) async {
    //   Map<String, dynamic> personalInfo =
    //       await getPerson(teamMember['personalInfo']);
    //   teamMembersResult.add({
    //     'id': widget.teamID,
    //     'firstName': personalInfo['firstName'],
    //     'lastName': personalInfo['lastName'],
    //     'address': personalInfo['address'],
    //     'phone': personalInfo['phone'],
    //     'dateOfBirth': personalInfo['dateOfBirth'],
    //   });
    // });
    // return teamMembersResult;
  }

  @override
  Widget build(BuildContext context) {
    int? teamID = widget.teamID != null ? widget.teamID : null;
    // TeamDetail? team = widget.team!=null?widget.team:null ;
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: getTeamMembersFromDB(),
        builder:
            //display team members in grid view, three items per row
            (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      if (snapshot.data?[index]['firstName'] != null)
                        Text(
                          snapshot.data?[index]['firstName'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (snapshot.data?[index]['lastName'] != null)
                        Text(
                          snapshot.data?[index]['lastName'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (snapshot.data?[index]['phone'] != null)
                        Text(
                          snapshot.data?[index]['phone'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (snapshot.data?[index]['email'] != null)
                        Text(
                          snapshot.data?[index]['email'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
