import 'package:flutter/widgets.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/config/di/injection_container.dart' as di;
import 'app/config/providers/blocsProviders.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await di.init();
  runApp(const BlocsProviders());
}
