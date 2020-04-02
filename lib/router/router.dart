import 'package:coronastats/mvoas/view/country_stats_page.dart';
import 'package:coronastats/mvoas/view/home_page.dart';
import 'package:flutter/material.dart';

class Router {
  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(),
        );
      case RouteName.countryStats:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CountryStatsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}

class RouteName {
  static const homePage = '/';

  static const countryStats = 'countryStats';
}
