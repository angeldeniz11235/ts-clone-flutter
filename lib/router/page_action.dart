import 'package:dev_jayhackett_blogdemo/router/page_configuration.dart';
import 'package:dev_jayhackett_blogdemo/router/page_state.dart';
import 'package:flutter/material.dart';

class PageAction {
  PageState state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction({this.state = PageState.none, this.page, this.pages, this.widget});
}
