import 'package:flutter/material.dart';

class BasePage extends Page {
  final Widget child;
  BasePage({Key? key, required this.child});
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        /* transitionDuration: const Duration(milliseconds: 10000),*/
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: /*animation.drive(CurveTween(curve: Curves.bounceIn)),*/
                Tween<double>(begin: 0.0, end: 5.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: this.child,
          );
        });
  }
}
