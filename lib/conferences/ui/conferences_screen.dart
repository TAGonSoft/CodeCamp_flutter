import 'package:CodeCamp/conferences/provider/conferences_provider.dart';
import 'package:CodeCamp/conferences/ui/conference_detaild_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_drawer.dart';

class ConferencesScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final conferencesProvider = Provider.of<ConferencesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Conferences'),
      ),
      body: ListView.builder(
        itemCount: conferencesProvider.conferences.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(conferencesProvider.conferences[index].title),
          subtitle: Text(conferencesProvider.conferences[index].venue.name),
          onTap: () {
            Navigator.of(context).pushNamed(ConferenceDetailedScreen.routeName);
          },
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
