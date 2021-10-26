import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:flutter/material.dart';

class TeamDetailsPage extends StatelessWidget {
  final TeamDetail? team;
  TeamDetailsPage({this.team});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // PlayerAvatar(),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${team?.headCoach?.first.firstName} ${team?.assistantCoach?.first.firstName}"),
                  SizedBox(height: 4.0),
                  Text("Mascot: ${team?.mascot}"),
                ],
              ),
            ],
          ),
        ),
        // Divider(),
        // Container(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text("Birthday"),
        //       Text("${team?.birthDate.toString()}")
        //     ],
        //   ),
        // ),
        // Divider(),
        // Container(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [Text("Gender"), Text("${team?.gender}")],
        //   ),
        // ),
        // Divider(),
        // Container(
        //   color: Colors.black54,
        //   padding: const EdgeInsets.all(16.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text("Contact Information"),
        //     ],
        //   ),
        // ),
        // ListView.builder(
        //   // physics: ScrollPhysics,
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: team?.guardian?.length ?? 2,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       padding: EdgeInsets.all(8.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                   "${team?.guardian?[index].firstName} ${team?.guardian?[index].lastName}"),
        //               SizedBox(height: 4.0),
        //               Text("${team?.guardian?[index].primaryEmail}"),
        //             ],
        //           ),
        //           IconButton(onPressed: () {}, icon: Icon(Icons.email))
        //         ],
        //       ),
        //     );
        //   },
        // ),
        // Divider(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       children: [
        //         Text((team?.firstName ?? "First Name") +
        //             " " +
        //             (team?.lastName ?? "Last Name")),
        //         Text(team?.number?.toString() ?? "Jersey Number"),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Column(
        //           children: [
        //             Text((team?.firstName ?? "First Name") +
        //                 " " +
        //                 (team?.lastName ?? "Last Name")),
        //             Text(team?.primaryEmail?.toString() ??
        //                 "primaryEmail@gmail.com"),
        //           ],
        //         ),
        //         SizedBox(height: 16),
        //         Column(
        //           children: [
        //             Text((team?.firstName ?? "First Name") +
        //                 " " +
        //                 (team?.lastName ?? "Last Name")),
        //             Text(team?.primaryEmail?.toString() ??
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
