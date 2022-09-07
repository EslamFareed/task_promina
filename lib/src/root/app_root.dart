import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_promina/layouts/main/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../core/style/dark/dark.dart';
import '../../core/style/light/light.dart';
import '../../cubits/main_cubit/main_cubit.dart';
import '../../cubits/main_cubit/main_cubit_states.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainCubit()),
      ],
      child: BlocConsumer<MainCubit, MainCubitStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            return ScreenUtilInit(
              designSize: const Size(360, 640),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, widget) => MaterialApp(
                debugShowCheckedModeBanner: false,
                builder: (context, widget) {
                  ScreenUtil.init(context);
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                },
                localizationsDelegates: const [
                  AppLocalizations.delegate, // Add this line
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ar', ''),
                ],
                locale: Locale.fromSubtags(languageCode: cubit.language),
                theme: lightMode,
                darkTheme: darkMode,
                themeMode: ThemeMode.light,
                home: const MainScreen(),
              ),
            );
          }),
    );
  }
}
