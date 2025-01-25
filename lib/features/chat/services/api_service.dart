import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frontend/api/api_constants.dart';
import 'package:frontend/features/chat/model/model.dart';
import 'package:frontend/features/home/models/mentor_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static get baseUrl => "http://192.168.137.1:3000";

  static get apiKey => null;

  static Future<Either<List<ModelsModel>, bool>> getMentorList() async {
    try {
      final url = Uri.parse("$baseUrl${Endpoints.getTutorArticles}");
      print(url);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final decodedValue = User.fromJson(jsonResponse);
        print("Decoded value is ");
        print(decodedValue);
        return left(jsonResponse);
      }
      return right(false);
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  static Future<String> getModels(File? file, String command) async {
    try {
      // await Gemini.instance.textAndImage(text: "What is this image?", images: [
      //   file!.readAsBytesSync(),
      // ]).then((value) {
      //   print("content is ");
      //   Part textarea = value!.content!.parts![0];
      //   print("textarea is ${textarea}");
      if (file == null) {
        // print("file is null $file");
        // final res = await Gemini.instance.chat([
        //   Content(parts: [
        //     Part.text(command),
        //   ])
        // ]);
        print("command is $command");
        final res = await Gemini.instance.text(
            "$command (reply with valid response if the prompt is inappropriate or is not related to study)");
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
