import 'package:CodeCamp/conferences/ui/conference_detaild_screen.dart';
import 'package:flutter/material.dart';

import './conferences/ui/conferences_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Camp',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ConferencesScreen(),
      routes: {
        ConferenceDetailedScreen.routeName: (ctx) => ConferenceDetailedScreen(),
      },
    );
  }
}
