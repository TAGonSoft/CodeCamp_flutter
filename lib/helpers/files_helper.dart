import 'dart:io';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class FilesHelper {
  static String assetsFolder = 'assets';
  static String jsonFilesFolder = 'jsonFiles';
  static String jsonFileExtension = 'json';
  static String conferencesFileName = 'conferences';
  static String detailedConferenceBaseName = 'conference_info';

  static String getBundlePath(String fileName) {
    return '$assetsFolder/$jsonFilesFolder/$fileName.$jsonFileExtension';
  }

  static Future<String> getConferencesFilePath() async {
    final documentsPath = await syspaths.getApplicationDocumentsDirectory();
    return path.join(documentsPath.path, '$conferencesFileName.$jsonFileExtension');
  }

  static Future<void> saveConferencesJson(String conferencesJson) async {
    final conferencesPath = await getConferencesFilePath();
    final conferencesFile = File(conferencesPath);
    await conferencesFile.writeAsString(conferencesJson);
  }

  static Future<String> getConferencesJson() async {
    final conferencesPath = await getConferencesFilePath();

    final conferencesFile = File(conferencesPath);
    String conferences = await conferencesFile.readAsString();
    print(conferences);
    return conferences;
  }
}
