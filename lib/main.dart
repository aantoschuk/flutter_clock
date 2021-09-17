import 'package:clock_app/models/theme_provider.dart';
import 'package:clock_app/screens/home.dart';
import 'package:clock_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
            builder: (context, theme, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Analog Clock',
                  theme: themeData(context),
                  darkTheme: darkThemeData(context),
                  themeMode:
                      theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
                  home: HomeScreen(),
                )));
  }
}
