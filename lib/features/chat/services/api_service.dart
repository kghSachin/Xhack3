import 'dart:developer';
import 'dart:io';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:frontend/features/chat/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static get baseUrl => null;

  static get apiKey => null;

  static Future<String> getModels(File? file, String command) async {
    try {
      // await Gemini.instance.textAndImage(text: "What is this image?", images: [
      //   file!.readAsBytesSync(),
      // ]).then((value) {
      //   print("content is ");
      //   Part textarea = value!.content!.parts![0];
      //   print("textarea is ${textarea}");
      if (file == null) {
        final res = await Gemini.instance.chat([
          Content(parts: [
            Part.text(command),
          ])
        ]);
        return res?.output ?? "Something went wrong";
      }
      final res = await Gemini.instance.prompt(parts: [
        Part.text(
            "$command (reply with valid response if the image is inappropriate or is not related to study)"),
        Part.bytes(file.readAsBytesSync()),
      ]);
      return res?.output ?? "Something went wrong";
      // print(jsonResponse);

      // return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error ${error}");
      rethrow;
    }
  }
}
