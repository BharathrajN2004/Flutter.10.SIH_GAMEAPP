import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utilities/Static/StaticData.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    addFirstTimeView();
    super.initState();
  }

  Future addFirstTimeView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(StaticData.isViewedFirstTime, true);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
