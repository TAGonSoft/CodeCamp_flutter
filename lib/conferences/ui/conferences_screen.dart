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
          itemBuilder: (ctx, index) {
            final conference = conferencesProvider.conferences[index];
            var location = conferencesProvider.conferences[index].venue.name;
            if (conferencesProvider.conferences[index].venue.city != null &&
                conferencesProvider.conferences[index].venue.city != '-') {
              location = location +
                  ', ' +
                  conferencesProvider.conferences[index].venue.city;
            }

            return ListTile(
              title: Text(conference.title),
              subtitle: Text(location),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ConferenceDetailedScreen.routeName);
              },
            );
          }),
      drawer: AppDrawer(),
    );
  }
}
