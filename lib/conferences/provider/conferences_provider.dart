import 'dart:convert';

import 'package:CodeCamp/conferences/model/conference.dart';
import 'package:CodeCamp/helpers/files_helper.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HTTPHelper {
  static const baseURL = 'https://connect.codecamp.ro/api/Conferences';
}

class ConferencesProvider with ChangeNotifier {
  List<Conference> _conferences = [];

  ConferencesProvider() {
    loadLocalData();
    fetchRemoteData();
  }

  Future<void> fetchRemoteData() async {
    try {
      final response = await http.get(HTTPHelper.baseURL);
      print('Response:${json.decode(response.body)}');
      FilesHelper.saveConferencesJson(response.body);
      loadLocalData();
    } catch (error) {
      print('Error:$error');
    }
  }

  Future<void> loadLocalData() async {
    final conferencesString = await FilesHelper.getConferencesJson();
    final jsonResult = json.decode(conferencesString);
    final conferences = jsonResult
        .map<Conference>((json) => Conference.fromJson(json))
        .toList();
    print('Conferecnes:$conferences');
    _conferences = conferences;
    notifyListeners();
  }

  List<Conference> get conferences {
    return [..._conferences];
  }
}
