import 'dart:developer';
import 'package:dev_jayhackett_blogdemo/API/database/database.dart';
import 'package:dev_jayhackett_blogdemo/models/coach.dart';
import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/team_detail_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/team_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class AddTeamPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderTextField(
                name: "teamName",
                decoration: InputDecoration(
                  hintText: 'Team Name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              FormBuilderTextField(
                name: "headCoach",
                decoration: InputDecoration(
                  hintText: 'Head Coach',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              FormBuilderTextField(
                name: "assistantCoach",
                decoration: InputDecoration(
                  hintText: 'Assistant Coach',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              FormBuilderTextField(
                name: "mascot",
                decoration: InputDecoration(
                  hintText: 'Team Mascot',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    var teamDetail = TeamDetail(
                      name: _formKey.currentState!.value['name'],
                      mascot: _formKey.currentState!.value['mascot'],
                      headCoach: [
                        Coach(
                            firstName:
                                _formKey.currentState!.value['headCoach'])
                      ],
                      assistantCoach: [
                        Coach(
                            firstName:
                                _formKey.currentState!.value['assistantCoach'])
                      ],
                    );
                    SaveTeam(_formKey.currentState!.value);
                    log(_formKey.currentState!.value.toString());
                    Provider.of<AppRouterDelegate>(context, listen: false)
                        .navigateTo(
                            TeamDetailRoutePath({"team": teamDetail.toJson()}));
                  },
                  child: Text("Submit")),
            ],
          ),
        ));
  }
}
