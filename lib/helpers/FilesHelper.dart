import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;

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

  static Future<String> getConferencesJson() async {
    final documentsPath = await syspaths.getApplicationDocumentsDirectory();
    final conferencesPath =
        path.join(documentsPath.path, '$conferencesFileName.$jsonFileExtension');

    File conferencesFile;

    if (FileSystemEntity.typeSync(conferencesPath) ==
        FileSystemEntityType.notFound) {
      print('Conferences file not found try to copy from bundle.');
      final conferencesData = await rootBundle.loadString(FilesHelper.getBundlePath(conferencesFileName));
      conferencesFile = File(conferencesPath);
      try {
        print(documentsPath.path);
        await conferencesFile.writeAsString(conferencesData);
      } catch (error) {
        print(error);
      }
    }

    conferencesFile = File(conferencesPath);
    String conferences = await conferencesFile.readAsString();
    print(conferences);
    return conferences;
  }

//  Future<Database> initializeDatabase() async {
//
//    Directory directory = await getApplicationDocumentsDirectory();
//    var dbPath = join(directory.path, "ch_departures.db");
//
//    // copy db file from Assets folder to Documents folder (only if not already there...)
//    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
//      ByteData data = await rootBundle.load("assets/ch_departures.db");
//      writeToFile(data, dbPath);
//    }
//
//    // Open/create the database at a given path
//    var departuresDatabase = await openDatabase(dbPath);
//    return departuresDatabase;
//  }
//
//  // HERE IS WHERE THE CODE CRASHES (WHEN TRYING TO WRITE THE LOADED BYTES)
//  void writeToFile(ByteData data, String path) {
//    final buffer = data.buffer;
//    return new File(path).writeAsBytesSync(
//        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
//  }
}
