import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utilities/Static/StaticData.dart';
import '../Utilities/Providers/ThemeProvider.dart';
import 'OnBoarding/OnBoarding.dart';
import 'Pages/Splash.dart';

bool? isViewedFirstTime;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences localData = await SharedPreferences.getInstance();
  localData.setBool(StaticData.isViewedFirstTime, false);
  isViewedFirstTime = localData.getBool(StaticData.isViewedFirstTime);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "LAW4CHILDREN",
          themeMode: themeProvider.themeMode,
          home: !isViewedFirstTime! ? const OnBoarding() : Splash(),
        );
      },
    );
  }
}
