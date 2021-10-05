import 'package:dev_jayhackett_blogdemo/router/page_configuration.dart';
import 'package:dev_jayhackett_blogdemo/router/pages.dart';
import 'package:dev_jayhackett_blogdemo/router/paths.dart';

class PageConfigurationItems {
  PageConfiguration SplashPageConfig = PageConfiguration(
      key: 'Splash',
      path: Paths.splashPath,
      uiPage: Pages.Splash,
      currentPageAction: null);
  PageConfiguration LoginPageConfig = PageConfiguration(
      key: 'Login',
      path: Paths.loginPath,
      uiPage: Pages.Login,
      currentPageAction: null);
  PageConfiguration CreateAccountPageConfig = PageConfiguration(
      key: 'CreateAccount',
      path: Paths.createAccountPath,
      uiPage: Pages.CreateAccount,
      currentPageAction: null);
  PageConfiguration ListItemsPageConfig = PageConfiguration(
      key: 'ListItems', path: Paths.listItemsPath, uiPage: Pages.List);
  PageConfiguration DetailsPageConfig = PageConfiguration(
      key: 'Details',
      path: Paths.playerDetailsPath,
      uiPage: Pages.Details,
      currentPageAction: null);
  PageConfiguration CartPageConfig = PageConfiguration(
      key: 'Cart',
      path: Paths.cartPath,
      uiPage: Pages.Cart,
      currentPageAction: null);
  PageConfiguration CheckoutPageConfig = PageConfiguration(
      key: 'Checkout',
      path: Paths.checkoutPath,
      uiPage: Pages.Checkout,
      currentPageAction: null);
  PageConfiguration SettingsPageConfig = PageConfiguration(
      key: 'Settings',
      path: Paths.settingsPath,
      uiPage: Pages.Settings,
      currentPageAction: null);
}
