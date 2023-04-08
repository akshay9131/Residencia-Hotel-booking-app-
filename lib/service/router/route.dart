import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/src/view/screens/category_screen.dart';
import 'package:travelapp/src/view/screens/city_list.dart';
import 'package:travelapp/src/view/screens/dashboard%20_screen.dart';
import 'package:travelapp/src/view/screens/detail_screen.dart';
import 'package:travelapp/src/view/screens/home_screen.dart';
import 'package:travelapp/src/view/screens/profile_screen.dart';
import 'package:travelapp/src/view/screens/search_screen.dart';
import 'package:travelapp/src/view/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

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
          builder: ((context, state) => const SplashScreen())),
      GoRoute(
        name: "detail",
        path: "/detail/:id",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: DetailScreen(
              id: state.params["id"]!,
            ),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
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
                return const NoTransitionPage(
                  child: HomeScreen(),
                );
              },
            ),
            GoRoute(
              path: '/search',
              name: "search",
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: SearchScreen(),
                  );
              },
            ),
            GoRoute(
              path: '/category',
              name: "category",
              pageBuilder: (context, state) {
                return  const NoTransitionPage(
                  child: CategoryScreen(),
                  );
              },
            ),
            GoRoute(
              path: '/profile',
              name: "profile",
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: ProfileScreen(),
                  );
              },
            )
          ])
    ]);

    return router;
  }
}
