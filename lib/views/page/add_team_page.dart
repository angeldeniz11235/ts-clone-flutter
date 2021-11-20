import 'dart:convert';
import 'dart:developer';
import 'package:dev_jayhackett_blogdemo/API/database/database.dart';
import 'package:dev_jayhackett_blogdemo/models/team_detail.dart';
import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/team_detail_route_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class AddTeamPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image(
                  image: AssetImage('lib/assets/img/wp4879207_2.jpg'),
                ).image,
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            child: Container(
                // make width of the container .8 of the screen width if the screen is less than 600 pixels or 500 pixels if the screen is greater than 600 pixels
                width: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.width * .8
                    : 500,
                //make the container height .8 of the screen height if the screen is less than 600 pixels or 500 pixels if the screen is greater than 600 pixels
                height: MediaQuery.of(context).size.height < 800
                    ? MediaQuery.of(context).size.height * .4
                    : 800,
                decoration: //white background wigh transparency and rounded corners
                    BoxDecoration(
                  color: Colors.brown.shade900.withOpacity(.97),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Hero(
                  tag: 'add_team_hero',
                  child: FormBuilder(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        height: 500,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Text(
                                    'Add Team',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.deepOrangeAccent[700],
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'Pacifico'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FormBuilderTextField(
                                  name: "teamName",
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.red[900],
                                    filled: true,
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(.9),
                                    ),
                                    hintText: 'Team Name',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red.shade900,
                                          width: 0.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange.shade600,
                                          width: 2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FormBuilderTextField(
                                  name: "mascot",
                                  decoration: InputDecoration(
                                    hintText: 'Mascot',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(.9),
                                    ),
                                    fillColor: Colors.red.shade900,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red.shade900,
                                          width: 0.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.deepOrange.shade600,
                                          width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: //padding for the button
                                    const EdgeInsets.fromLTRB(80, 10, 80, 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 5,
                                      primary: Colors.green.shade400,
                                    ),
                                    onPressed: () async {
                                      _formKey.currentState!.save();
                                      var teamDetail = TeamDetail(
                                        name: _formKey
                                            .currentState!.value['teamName'],
                                        mascot: _formKey
                                            .currentState!.value['mascot'],
                                        hqAddress: 40,
                                        league: 44,
                                      );
                                      Map<String, dynamic> resData =
                                          await saveTeam(teamDetail.toJson());
                                      log("Form inputs:\n" +
                                          _formKey.currentState!.value
                                              .toString());
                                      if (resData['error'] == false) {
                                        Provider.of<AppRouterDelegate>(context,
                                                listen: false)
                                            .navigateTo(TeamDetailRoutePath({
                                          "team": teamDetail.toJson(),
                                          "data": (json.encode(resData))
                                        }));
                                      }
                                    },
                                    child: Text("Submit")),
                              ),
                            ),
                            //blue button
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: //padding for the button
                                    const EdgeInsets.fromLTRB(80, 10, 80, 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 5,
                                      primary: Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      _formKey.currentState!.reset();
                                    },
                                    child: Text("Reset")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
