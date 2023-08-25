import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dependency_container.dart' as di;
import 'myApp.dart';
void main() async {
  WidgetsFlutterBinding?.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale('en','US'),
            Locale('ur','PK'),
          ],
          startLocale: const Locale('ur','PK'),
          path: "assets/translations",
          fallbackLocale: const Locale('ur','PK'),
          child: const MyApp())
  );
}