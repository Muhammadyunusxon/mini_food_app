import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:mini_food_app/application/app_provider.dart';
import 'package:mini_food_app/presentation/style/style.dart';
import 'package:mini_food_app/presentation/view/init/no_internet.dart';
import 'package:mini_food_app/presentation/view/init/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            themeMode: context.watch<AppProvider>().isLightTheme
                ? ThemeMode.light
                : ThemeMode.dark,
            theme: ThemeData.light().copyWith(
                primaryColor: Style.primaryColor,
                colorScheme:
                    ColorScheme.light().copyWith(error: Style.errorLight),
                textTheme: TextTheme(
                  labelSmall: Style.regular(size: 12),
                  labelMedium: Style.normal(),
                  labelLarge: Style.bold(),
                  titleSmall: Style.regular(color: Style.white,size: 12),
                  titleMedium: Style.normal(color: Style.white),
                  titleLarge: Style.bold(color: Style.white),
                )),
            darkTheme: ThemeData.dark().copyWith(
                primaryColor: Style.primaryDarkColor,
                colorScheme:
                    ColorScheme.dark().copyWith(error: Style.errorDark),
                textTheme: TextTheme(
                    labelSmall: Style.regular(color: Style.white),
                    labelMedium: Style.normal(color: Style.white),
                    labelLarge: Style.bold(color: Style.white))),
            home: StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (
                BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot,
              ) {
                if (snapshot.data == ConnectivityResult.wifi ||
                    snapshot.data == ConnectivityResult.mobile) {
                  return SplashPage();
                } else {
                  return NoInternet();
                }
              },
            ),
          );
        });
  }
}
