import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
  class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreenContent();
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({Key? key}) : super(key: key);

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {


  @override


  void initState(){

    super.initState();
    Timer(const Duration(seconds: 2),(){

      AppState appState = sl();
      appState.goToNext(PageConfigs.jokeScreenPageConfig,pageState: PageState.replace );
    }
    );

  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: const Text("SPlash Screen"),
    ));
  }
}
