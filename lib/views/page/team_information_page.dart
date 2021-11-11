//statefull widget

import 'package:flutter/material.dart';

class TeamInformationPage extends StatefulWidget {
  int? teamID;
  TeamInformationPage({Key? key, this.teamID}) : super(key: key);

  @override
  _TeamInfomationPageState createState() => _TeamInfomationPageState();
}

class _TeamInfomationPageState extends State<TeamInformationPage> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (String str) {
            setState(() {
              name = str;
            });
          },
        ),
        Text(widget.teamID?.toString() ?? ""),
      ],
    );
  }
}
