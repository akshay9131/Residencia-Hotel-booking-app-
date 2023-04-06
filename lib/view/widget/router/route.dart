import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/view/screens/category_screen.dart';
import 'package:travelapp/view/screens/city_list.dart';
import 'package:travelapp/view/screens/dashboard%20_screen.dart';
import 'package:travelapp/view/screens/detail_screen.dart';
import 'package:travelapp/view/screens/home_screen.dart';
import 'package:travelapp/view/screens/profile_screen.dart';
import 'package:travelapp/view/screens/search_screen.dart';
import 'package:travelapp/view/screens/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

class router {
  static GoRouter goRouter() {
    GoRouter router =
        GoRouter(initialLocation: "/", navigatorKey: _rootNavigator, routes: [
      GoRoute(
          name: "SplashScreen",
          path: "/",
          builder: ((context, state) => SplashScreen())),
      GoRoute(
          name: "detail",
          path: "/detail/:id",
          builder: ((context, state) => DetailScreen(
                id: state.params["id"]!,
              ))),
      GoRoute(
          name: "citylist",
          path: "/citylist/:city",
          builder: ((context, state) => CityList(
                city: state.params["city"]!,
              ))),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) => DashboardScreen(child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: "home",
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: HomeScreen());
              },
            ),
            GoRoute(
              path: '/search',
              name: "search",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: SearchScreen());
              },
            ),
            GoRoute(
              path: '/category',
              name: "category",
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: CategoryScreen());
              },
            ),
            GoRoute(
              path: '/profile',
              name: "profile",
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ProfileScreen());
              },
            )
          ])
    ]);

    return router;
  }
}
