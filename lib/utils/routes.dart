import 'package:caranga/features/fipe/presentation/pages/home_page.dart';
import 'package:caranga/utils/app_routes.dart';
import 'package:flutter/material.dart';

class Routes {
  final Map<String, Widget Function(BuildContext)> routesMap = {
    AppRoutes.home: (ctx) => const HomePage(),
    AppRoutes.carDetail: (ctx) => const HomePage(),
  };
  get routes {
    return routesMap;
  }

  get initialRoute {
    return AppRoutes.home;
  }
}
