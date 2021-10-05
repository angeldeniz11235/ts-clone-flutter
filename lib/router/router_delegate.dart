import 'dart:async';
import 'package:dev_jayhackett_blogdemo/router/navigator_key_constants.dart';
import 'package:dev_jayhackett_blogdemo/router/pages/base_page.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/app_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/home_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/messages_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/more_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/roster_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/schedule_route_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  List<AppRoutePath> _configuration = [];
  AppRoutePath _currentRoute = HomeRoutePath();

  AppRoutePath get currentRoute => _currentRoute;
  bool get _hasBackButton => _configuration.isNotEmpty;
  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigationKey;

  void navigateTo(AppRoutePath routePath) {
    _configuration.add(_currentRoute);
    _currentRoute = routePath;
    notifyListeners();
  }

  void navigateToIndex(int routePathIndex) {
    AppRoutePath routePath;
    switch (routePathIndex) {
      case 0:
        routePath = HomeRoutePath();
        break;
      case 1:
        routePath = ScheduleRoutePath();
        break;
      case 2:
        routePath = RosterRoutePath();
        break;
      case 3:
        routePath = MessagesRoutePath();
        break;
      case 4:
        routePath = MoreRoutePath();
        break;
      default:
        routePath = HomeRoutePath();
        break;
    }
    navigateTo(routePath);
  }

  void navigateBack() {
    if (_hasBackButton) {
      _currentRoute = _configuration.last;
      _configuration.removeLast();
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        BasePage(child: Consumer<AppRouterDelegate>(
          builder: (context, routePath, oldWidget) {
            return AppScaffold(
              hasBackButton: _hasBackButton,
              currentRoute: _currentRoute,
              navigateBack: navigateBack,
            );
          },
        )),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        } else {
          notifyListeners();
          return true;
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    // _configuration.add(configuration);
    print("changeRoute");
    print(configuration.location);
    notifyListeners();
  }
}

class AppScaffold extends StatefulWidget {
  final bool hasBackButton;
  final Function navigateBack;
  final AppRoutePath currentRoute;
  AppScaffold(
      {required this.hasBackButton,
      required this.navigateBack,
      required this.currentRoute});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.hasBackButton
            ? IconButton(
                onPressed: () => widget.navigateBack(),
                icon: Icon(Icons.arrow_back))
            : Container(),
        title: Text("Team Snap Clone"),
      ),
      body: widget.currentRoute.child(widget.currentRoute.routeData),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          Provider.of<AppRouterDelegate>(context, listen: false)
              .navigateToIndex(index);
        },
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white54,
        currentIndex: widget.currentRoute.routeIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Roster"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          // BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
        ],
      ),
    );
  }
}
