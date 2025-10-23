import 'package:flutter/material.dart';

import '../config/router/router.dart';
import '../config/theme/app_theme.dart';
import '../generated/l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme(isDarkmode: false).getTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
