import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../di/di_setup.dart';
import '../../presentation/group_page/group_screen.dart';
import '../../presentation/group_page/group_view_model.dart';
import '../../presentation/home_page/home_screen.dart';
import '../../presentation/home_page/home_view_model.dart';
import '../../presentation/login_page/login_screen.dart';
import '../../presentation/login_page/login_view_model.dart';
import '../../presentation/my_page/my_screen.dart';
import '../../presentation/my_page/my_view_model.dart';
import '../../presentation/sign_up_page/sign_up_screen.dart';
import '../../presentation/sign_up_page/sign_up_view_model.dart';

final GoRouter router = GoRouter(
  initialLocation: '/loginPage',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Group'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'My Page'),
            ],
            currentIndex: navigationShell.currentIndex,
            onTap: (int index) {
              navigationShell.goBranch(index);
            },
          ),
        );
      },
      branches: <StatefulShellBranch>[
        // Home Tab
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/homePage',
              builder: (BuildContext context, GoRouterState state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt.get<HomeViewModel>(),
                  child: HomeScreen(),
                );
              },
            ),
          ],
        ),

        // Group Tab
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/groupPage',
              builder: (BuildContext context, GoRouterState state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt.get<GroupViewModel>(),
                  child: GroupScreen(),
                );
              },
            ),
          ],
        ),

        // My Page Tab
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/myPage',
              builder: (BuildContext context, GoRouterState state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt.get<MyViewModel>(),
                  child: MyScreen(),
                );
              },
            ),
          ],
        ),
      ],
    ),

    // Login Page
    GoRoute(
      path: '/loginPage',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => getIt.get<LoginViewModel>(),
          child: LoginScreen(),
        );
      },
    ),

    // Sign Up Page
    GoRoute(
      path: '/signUpPage',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => getIt.get<SignUpViewModel>(),
          child: SignUpScreen(),
        );
      },
    ),
  ],
);
