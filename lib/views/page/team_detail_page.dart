import 'dart:convert';

import 'package:dev_jayhackett_blogdemo/API/database/database.dart';
import 'package:dev_jayhackett_blogdemo/models/person.dart';
import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:dev_jayhackett_blogdemo/models/team_member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamDetailsPage extends StatefulWidget {
  final TeamDetail? team;
  final String? data;

  TeamDetailsPage({this.team, this.data});

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class SelectedPlayers extends ChangeNotifier {
  List<String> _selectedPlayers = [];

  List<String> get getSelectedPlayers => _selectedPlayers;

  changeSelectedPlayer(String player) {
    if (_selectedPlayers.contains(player)) {
      _selectedPlayers.remove(player);
    } else {
      _selectedPlayers.add(player);
    }
    notifyListeners();
  }
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  List<Map<String, dynamic>>? players;
  List<Map<String, dynamic>>? persons;
  Person? person;
  TeamMember? player;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedPlayers(),
      child: FutureBuilder(
          future: Future.wait([getPlayers(), getPersons()]),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>>? snapshot) {
            players = snapshot?.data?[0];
            persons = snapshot?.data?[1];
            return players == null
                ? Container()
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // PlayerAvatar(),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200,
                                  child: Text(
                                      json.decode(widget.data!)["message"])),
                              Text(
                                  "New Team ${widget.team?.name}, in League ${widget.team?.league} Created"),
                              SizedBox(height: 10.0),
                              Text("Mascot: ${widget.team?.mascot}"),
                              Expanded(
                                  child: ListView.builder(
                                      itemCount:
                                          players == null ? 0 : players?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        person = Person.fromJson(persons!
                                            .firstWhere((p) =>
                                                p["ID"] ==
                                                players?.elementAt(
                                                    index)["personalInfo"]));
                                        player = TeamMember.fromJson(
                                            players!.elementAt(index));

                                        return GestureDetector(
                                          onTap: () {
                                            Provider.of<SelectedPlayers>(
                                                    context,
                                                    listen: false)
                                                .changeSelectedPlayer(
                                                    players![index].toString());
                                          },
                                          child: new Card(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                new Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Provider.of<
                                                                  SelectedPlayers>(
                                                              context,
                                                              listen: true)
                                                          .getSelectedPlayers
                                                          .contains(
                                                              players![index]
                                                                  .toString())
                                                      ? Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: Colors.grey,
                                                        ),
                                                ),
                                                new Text((person?.firstName ??
                                                        '') +
                                                    ' ' +
                                                    (person?.lastName ?? '')),
                                              ],
                                            ),
                                          ),
                                        );
                                      }))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
