import 'dart:convert';

import 'package:CodeCamp/conferences/model/conference.dart';
import 'package:CodeCamp/helpers/FilesHelper.dart';
import 'package:flutter/material.dart';

class ConferencesProvider with ChangeNotifier {
  List<Conference> _conferences = [];

  ConferencesProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    final conferencesString = await FilesHelper.getConferencesJson();
    final jsonResult = json.decode(conferencesString);
    final conferences = jsonResult.map<Conference>((json) => Conference.fromJson(json)).toList();
    print('Conferecnes:$conferences');
    _conferences = conferences;
    notifyListeners();
  }

  List<Conference> get conferences {
    return [..._conferences];
  }
}