import 'package:flutter/material.dart';

class BasePage extends Page {
  final Widget child;
  BasePage({Key? key, required this.child});
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.bounceIn)),
            child: this.child,
          );
        });
  }
}
