import 'package:dev_jayhackett_blogdemo/router/page_action.dart';
import 'package:dev_jayhackett_blogdemo/router/pages.dart';

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction? currentPageAction;

  PageConfiguration(
      {required this.key,
      required this.path,
      required this.uiPage,
      this.currentPageAction});
}
