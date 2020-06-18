import 'package:flutter/material.dart';

class ConferenceWidget extends StatelessWidget {
  final String name;

  ConferenceWidget({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(name),);
  }
}
