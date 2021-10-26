import 'package:dev_jayhackett_blogdemo/models/team_member.dart';
import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/player_detail_route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<TeamMember> teamMembers =
        []; //var players = PlayerService.getTeamMembers();
    return ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: 10, //players.length,
        separatorBuilder: (context, i) => Divider(),
        itemBuilder: (context, i) {
          Map<String, dynamic> playerJson = {
            "number": i + 1,
            "firstName": "FirstName$i",
            "lastName": "LastName$i",
            "guardian": [
              {
                "firstName": "FirstName$i",
                "lastName": "LastName$i",
                "primaryEmail": "email$i",
              },
              {
                "firstName": "FirstName$i",
                "lastName": "LastName$i",
                "primaryEmail": "email$i",
              }
            ]
          };

          teamMembers.add(TeamMember.fromJson(
              playerJson)); // TeamMember.fromJson(players[i])
          return PlayerListItem(teamMember: teamMembers[i]);
        });
  }
}

class PlayerListItem extends StatelessWidget {
  final TeamMember teamMember;
  PlayerListItem({required this.teamMember});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Provider.of<AppRouterDelegate>(context, listen: false)
              .navigateTo(PlayerDetailRoutePath({"teamMember": teamMember}));
        },
        leading: PlayerAvatar(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${teamMember.firstName} ${teamMember.lastName}"),
            SizedBox(height: 4.0),
            Text("# ${teamMember.number.toString()}"),
          ],
        ),
        trailing: Icon(Icons.arrow_right));
  }
}

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black87, height: 36, width: 36);
  }
}
