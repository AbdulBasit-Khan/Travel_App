import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_template/provider/app_provider.dart';


import 'package:travel_app_template/screens/splash_screen.dart';
import 'package:travel_app_template/utils/const.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      
      ChangeNotifierProvider(create: (_) => AppProvider()),
            
      

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, value, child) => MaterialApp(
              key: value.key,
              debugShowCheckedModeBanner: false,
              navigatorKey: value.navigatorKey,
              title: Constants.appName,
              theme: value.theme,
              darkTheme: Constants.darkTheme,
              home: const SplashScreen(),
            ));
  }
}
