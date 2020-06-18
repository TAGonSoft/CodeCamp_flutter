import 'package:CodeCamp/conferences/ui/conference_detaild_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_drawer.dart';

class ConferencesScreen extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conferences'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) => ListTile(
          title: Text('Iasi CodeCamp!'),
          subtitle: Text('address of the camp -> Palce'),
          onTap: () {
            Navigator.of(context).pushNamed(ConferenceDetailedScreen.routeName);
          },
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
