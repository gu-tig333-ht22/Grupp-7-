import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class MyAppStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/myDir.json');
  }

  Future<Map<String, dynamic>> readJsonFile() async {
    File file = await _localFile;

    if (await file.exists()) {
      try {
        var fileContent = await file.readAsString();
        return jsonDecode(fileContent);
      } catch (e) {
        print(e);
      }
    }
    return {};
  }

  void writeState(String today, String cat, String cont) async {
    final file = await _localFile;
    final content = await readJsonFile();

    content[today] = {cat: cont};

    var jsonContent = jsonEncode(content);

    file.writeAsString(jsonContent);
  }
}
