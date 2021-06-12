import 'package:flutter/material.dart';

class LoginPageSetState extends StatefulWidget {
  LoginPageSetState({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageSetStateState createState() => _LoginPageSetStateState();
}

class _LoginPageSetStateState extends State<LoginPageSetState> {
  bool isLoading = false;

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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 36.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(500, 50),
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            _toggleLoader(state: true);
                            Future.delayed(const Duration(seconds: 3), () {
                              _toggleLoader(state: false);
                            });
                          },
                    child: isLoading
                        ? SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: CircularProgressIndicator(),
                          )
                        : Text("Login"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
