import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/auth_provider.dart';
import 'package:setup_provider/application/chat_provider.dart';
import 'package:setup_provider/domain/di/di.dart';
import 'package:setup_provider/infastructura/repo/auth_repo.dart';

import 'application/app_provider.dart';
import 'presentation/app_widget.dart';
import 'presentation/style/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Style.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  setUp();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("uz", "UZ")],
      path: 'assets/tr',
      startLocale: Locale("uz", "UZ"),
      fallbackLocale: Locale("uz", "UZ"),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => AppProvider()..setTheme(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => AuthProvider(authRepo),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => ChatProvider()..connectSocket(),
          )
        ],
        child: AppWidget(),
      ),
    ),
  );
}
