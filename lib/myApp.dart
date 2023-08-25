import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/uremit_back_button_dispatcher.dart';
import 'core/router/uremit_router_delegate.dart';
import 'core/router/uremit_router_parser.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/theme/app_theme.dart';

bool isSessionExpired = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UremitRouterDelegate delegate;
  late UremitBackButtonDispatcher backButtonDispatcher;
  late UremitRouterParser parser = UremitRouterParser();

  @override
  void initState() {
    delegate = UremitRouterDelegate(sl());
    backButtonDispatcher = UremitBackButtonDispatcher(sl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return ScreenUtilInit(
      designSize: const Size(360, 804),
      builder: (c, ch) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: snackbarKey,
          title: 'Starting Project',
          theme: AppTheme.appTheme,
          routerDelegate: delegate,
          backButtonDispatcher: backButtonDispatcher,
          routeInformationParser: parser,
        ),
      ),
    );
  }
}
