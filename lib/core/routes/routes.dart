import 'package:flutter/material.dart';
import 'package:to_do_test_app/view/home_page/home_page_view/home_page_view.dart';
import 'package:to_do_test_app/view/initial_page/initial_page_view/initial_page_view.dart';

class GenrateRouterr {
  static routeGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case "/home":
        return MaterialPageRoute(builder: (_) => const Homepage());
    }
  }
}
