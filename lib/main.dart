import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/config/di/injection_container.dart' as di;
import 'app/presentation/myApp.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await di.init();
  runApp(const ProviderScope(child: MyApp()));
}
