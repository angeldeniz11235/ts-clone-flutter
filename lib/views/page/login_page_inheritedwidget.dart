import 'package:dev_jayhackett_blogdemo/bloc/app_bloc.dart';
import 'package:dev_jayhackett_blogdemo/views/page/home_page.dart';
import 'package:flutter/material.dart';

class LoginPageInheritedWidget extends StatefulWidget {
  LoginPageInheritedWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageInheritedWidgetState createState() =>
      _LoginPageInheritedWidgetState();
}

class _LoginPageInheritedWidgetState extends State<LoginPageInheritedWidget> {
  bool isLoading = false;
  bool? isAuthenticated;
  TextEditingController? _usernameTextController;
  TextEditingController? _passwordTextController;
  @override
  void initState() {
    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    super.initState();
  }

  void _toggleLoader({bool? state}) {
    setState(() {
      isLoading = state ?? !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
            child: Container(
          constraints: BoxConstraints(maxWidth: 400.0),
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40.0),
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: _usernameTextController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 36.0,
                    ),
                    TextFormField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(500, 50),
                    ),
                    onPressed: () async {
                      _toggleLoader(state: true);
                      var bloc = AppBloc.of(context);
                      bool isAuthenticated = await bloc?.authenticate(
                              _usernameTextController!.text,
                              _passwordTextController!.text) ??
                          false;
                      if (isAuthenticated) {
                        _toggleLoader(state: false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(),
                          ),
                        );
                      } else {
                        _toggleLoader(state: false);
                      }
                    },
                    child: isLoading
                        ? SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: CircularProgressIndicator(),
                          )
                        : Text("Login")),
                isAuthenticated == false ? Text("Login Failed") : Container()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
