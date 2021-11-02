import 'dart:convert';

import 'package:dev_jayhackett_blogdemo/API/database/database.dart';
import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:flutter/material.dart';

class TeamDetailsPage extends StatefulWidget {
  final TeamDetail? team;
  final String? data;

  TeamDetailsPage({this.team, this.data});

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  List<Map<String, dynamic>>? players;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPlayers(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>>? snapshot) {
          players = snapshot?.data;
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
                                child:
                                    Text(json.decode(widget.data!)["message"])),
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
                                      return new Card(
                                        child: new Text(players?[index]
                                                    ['personalInfo']
                                                ?.toString() ??
                                            ''),
                                      );
                                    }))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}
