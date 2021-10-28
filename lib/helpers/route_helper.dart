import 'package:flutter/material.dart';

class RouteHelper {
  RouteHelper._();

  static RouteHelper routeHelper = RouteHelper._();
  GlobalKey<NavigatorState> navKay = GlobalKey<NavigatorState>();

  pushNamed(String routeName) {
    navKay.currentState.pushNamed(routeName);
  }

  back() {
    navKay.currentState.pop();
  }
}
