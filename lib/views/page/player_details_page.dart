import 'package:dev_jayhackett_blogdemo/models/team_member.dart';
import 'package:dev_jayhackett_blogdemo/views/page/player_list_page.dart';
import 'package:flutter/material.dart';

class PlayerDetailsPage extends StatelessWidget {
  final TeamMember? teamMember;
  PlayerDetailsPage({this.teamMember, playerId});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              PlayerAvatar(),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text("${teamMember?.firstName} ${teamMember?.lastName}"),
                  SizedBox(height: 4.0),
                  //Text("# ${teamMember?.number.toString()}"),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Birthday"),
              //Text("${teamMember?.birthDate.toString()}")
            ],
          ),
        ),
        Divider(),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //children: [Text("Gender"), Text("${teamMember?.gender}")],
          ),
        ),
        Divider(),
        Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Contact Information"),
            ],
          ),
        ),
        ListView.builder(
          // physics: ScrollPhysics,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          //itemCount: teamMember?.guardian?.length ?? 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //     "${teamMember?.guardian?[index].firstName} ${teamMember?.guardian?[index].lastName}"),
                      // SizedBox(height: 4.0),
                      // Text("${teamMember?.guardian?[index].primaryEmail}"),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.email))
                ],
              ),
            );
          },
        ),
        Divider(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       children: [
        //         Text((teamMember?.firstName ?? "First Name") +
        //             " " +
        //             (teamMember?.lastName ?? "Last Name")),
        //         Text(teamMember?.number?.toString() ?? "Jersey Number"),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Column(
        //           children: [
        //             Text((teamMember?.firstName ?? "First Name") +
        //                 " " +
        //                 (teamMember?.lastName ?? "Last Name")),
        //             Text(teamMember?.primaryEmail?.toString() ??
        //                 "primaryEmail@gmail.com"),
        //           ],
        //         ),
        //         SizedBox(height: 16),
        //         Column(
        //           children: [
        //             Text((teamMember?.firstName ?? "First Name") +
        //                 " " +
        //                 (teamMember?.lastName ?? "Last Name")),
        //             Text(teamMember?.primaryEmail?.toString() ??
        //                 "primaryEmail@gmail.com"),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
