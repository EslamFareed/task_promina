import 'package:flutter/material.dart';

import 'repositories/source/local/cache/cache_helper.dart';
import 'repositories/source/remote/dio/dio_helper.dart';
import 'src/root/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const AppRoot());
}
