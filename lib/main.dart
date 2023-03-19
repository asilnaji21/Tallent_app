import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/networks/local/cache_helper.dart';
import 'data/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await sl<Supervisor>().initSP();
  runApp(MyApp());
}
