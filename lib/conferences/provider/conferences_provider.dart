import 'package:flutter/material.dart';

class ConferencesProvider with ChangeNotifier {

  //String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
  //final jsonResult = json.decode(data);

  Future<void> fetchData() async {

    
    notifyListeners();
  }
  
}