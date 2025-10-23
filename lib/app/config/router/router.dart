import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/modules/home/views/homeView.dart';
import '../../presentation/modules/onboarding/views/onboardingView.dart';
import '../../presentation/myApp.dart';
import 'paths.dart';
import 'routes.dart';

mixin RouterMixin on State<MyApp> {
  final _router = GoRouter(
    initialLocation: Paths.onboarding,
    errorBuilder: (_, state) => OnboardingView(),
    routes: [
      GoRoute(
        name: Routes.home,
        path: Paths.home,
        builder: (_, __) => HomeView(),
      ),
      GoRoute(
        name: Routes.onboarding,
        path: Paths.onboarding,
        builder: (_, __) => OnboardingView(),
      ),
    ],
  );

  GoRouter get router => _router;
}
