import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/bloc_observer.dart';
import 'repositories/source/local/cache/cache_helper.dart';
import 'repositories/source/remote/dio/dio_helper.dart';
import 'src/root/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  BlocOverrides.runZoned(
    () => runApp(const AppRoot()),
    blocObserver: MyBlocObserver(),
  );
}
