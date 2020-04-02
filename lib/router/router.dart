import 'package:flutter/material.dart';


class Router {
  static Route generator(RouteSettings settings){
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Container(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
        );
    }
  }
}

class RouteName {
  static const homePage = '/';

}
