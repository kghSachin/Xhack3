import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/uri.dart';
import 'package:frontend/widgets/show_snackbar.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> loginUser({
    required BuildContext context,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/auth/login'),
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, 'Some error occured');
      }
    }
  }
}
