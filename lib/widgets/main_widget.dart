import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.showDebugBanner,
    required this.title,
    required this.lightTheme,
    required this.darkTheme,
    required this.navigatorObservers,
    required this.child,
  });

  final bool showDebugBanner;
  final String title;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final List<NavigatorObserver> navigatorObservers;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: showDebugBanner,
      title: title,
      theme: lightTheme,
      darkTheme: darkTheme,
      navigatorObservers: navigatorObservers,
      home: child,
    );
  }
}
