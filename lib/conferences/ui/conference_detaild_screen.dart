import 'package:flutter/material.dart';

class ConferenceDetailedScreen extends StatelessWidget {
  static const routeName = '/conference-detailed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conferences'),
      ),
      body: Text('Conference'),
    );
  }
}
