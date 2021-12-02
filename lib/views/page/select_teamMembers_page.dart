import 'dart:convert';

import 'package:dev_jayhackett_blogdemo/API/database/database.dart';
import 'package:dev_jayhackett_blogdemo/models/person.dart';
import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:dev_jayhackett_blogdemo/models/team_member.dart';
import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/team_information_route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectTeamMembersPage extends StatefulWidget {
  final TeamDetail? team;
  final String? data;

  SelectTeamMembersPage({this.team, this.data});

  @override
  State<SelectTeamMembersPage> createState() => _SelectTeamMembersPageState();
}

//class to handle what happens when a teamMember is tapped on the list
class SelectedTeamMembers extends ChangeNotifier {
  List<TeamMember> _selectedTeamMembers = [];

  List<TeamMember> get getSelectedPlayers => _selectedTeamMembers;

  //check if a teamMember is already selected
  bool isSelected(TeamMember teamMember) {
    if (this
            .getSelectedPlayers
            .firstWhere((p) => p.id == teamMember.id,
                //return a dummy Teammember if not found
                orElse: () => TeamMember(
                    id: -1, //dummyid
                    guardian1: null,
                    guardian2: null,
                    personalInfo: null,
                    position: '',
                    team: null))
            .id !=
        -1) {
      return true;
    } else {
      return false;
    }
  }

  changeSelectedPlayer(TeamMember selectedTeamMember) {
    if (this.isSelected(selectedTeamMember)) {
      _selectedTeamMembers.removeWhere((p) => p.id == selectedTeamMember.id);
    } else {
      _selectedTeamMembers.add(selectedTeamMember);
    }
    notifyListeners();
  }
}

class _SelectTeamMembersPageState extends State<SelectTeamMembersPage> {
  List<Map<String, dynamic>>? teamMemberJson;
  List<Map<String, dynamic>>? personJson;
  Person? person;
  TeamMember? teamMember;
  List<TeamMember>? teamMemberList;

  //get data from the widget.data
  int getTeamID() {
    if (widget.data != null) {
      return json.decode(widget.data!)!['teamID'];
    } else {
      return -1;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Team Created!'),
        duration: Duration(milliseconds: 600),
      ));
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        content: Text('Loading Team Members'),
        duration: Duration(milliseconds: 600),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var teamID = getTeamID();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image(
                    image: AssetImage('lib/assets/img/uwp128885_2.jpg'),
                  ).image),
            ),
            child: ChangeNotifierProvider<SelectedTeamMembers>(
              create: (context) => SelectedTeamMembers(),
              child: FutureBuilder<List>(
                  future: Future.wait([getPlayers(), getPersons()]),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>>? snapshot) {
                    teamMemberJson = snapshot?.data?[0];
                    personJson = snapshot?.data?[1];
                    return teamMemberJson == null
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // PlayerAvatar(),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "New Team ${widget.team?.name}, in League ${widget.team?.league} Created"),
                                      SizedBox(height: 10.0),
                                      Text("Mascot: ${widget.team?.mascot}"),
                                      Expanded(
                                          child: ListView.builder(
                                              itemCount: teamMemberJson == null
                                                  ? 0
                                                  : teamMemberJson?.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                person = Person.fromJson(
                                                    personJson!.firstWhere((p) =>
                                                        p["ID"] ==
                                                        teamMemberJson
                                                                ?.elementAt(
                                                                    index)[
                                                            "personalInfo"]));
                                                teamMember =
                                                    TeamMember.fromJson(
                                                        teamMemberJson!
                                                            .elementAt(index));

                                                return GestureDetector(
                                                  onTap: () {
                                                    //if player is not null, add player to teamMembers list
                                                    Provider.of<SelectedTeamMembers>(
                                                            context,
                                                            listen: false)
                                                        .changeSelectedPlayer(
                                                            TeamMember.fromJson(
                                                                teamMemberJson![
                                                                    index]));
                                                  },
                                                  child: new Card(
                                                    color: Colors.blue[800]
                                                        ?.withOpacity(.75),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        new Container(
                                                          //white background

                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              //check if selected player exists in selectedPlayers list
                                                              Provider.of<SelectedTeamMembers>(
                                                                          context,
                                                                          listen:
                                                                              true)
                                                                      .isSelected(
                                                                          TeamMember.fromJson(
                                                                              teamMemberJson![index]))
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_box,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .check_box_outline_blank,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                        ),
                                                        new Text(
                                                            (person?.firstName ??
                                                                    '') +
                                                                ' ' +
                                                                (person?.lastName ??
                                                                    ''),
                                                            style: TextStyle(
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })),
                                      //submit button
                                      Container(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.blue[800]),
                                          child: Text('Submit'),
                                          onPressed: () {
                                            // teamID =
                                            //     json.decode(widget.data!)['data'];
                                            //update selectedPlayers team field to this team
                                            Provider.of<SelectedTeamMembers>(
                                                    context,
                                                    listen: false)
                                                .getSelectedPlayers
                                                .forEach((p) {
                                              p.team = teamID;
                                              updateTeamMember(
                                                  p.toJson(), p.id.toString());
                                            });
                                            Provider.of<AppRouterDelegate>(
                                                    context,
                                                    listen: false)
                                                .navigateTo(
                                                    TeamInformationRoutePath({
                                              //convert teamID to an inteager
                                              'teamID': teamID.toInt(),
                                              "data": json.encode(Provider.of<
                                                          SelectedTeamMembers>(
                                                      context,
                                                      listen: false)
                                                  .getSelectedPlayers
                                                  .map((e) => e.toJson())
                                                  .toList())
                                            }));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
