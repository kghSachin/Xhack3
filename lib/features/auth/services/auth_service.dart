import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/features/home/main_page.dart';
import 'package:frontend/uri.dart';
import 'package:frontend/widgets/show_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> signIn({
    required BuildContext context,
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response res = await http.post(
        Uri.parse('$uri/api/auth/login'),
        body: jsonEncode({
          'phone': phoneNumber,
          'password': password,
          'role': role,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        var token = jsonDecode(res.body)['access_token'];
        prefs.setString('authorization', 'Bearer $token');
        Navigator.pushNamed(context, MainPage.routeName);
      } else {
        showSnackBar(context, jsonDecode(res.body)['message']);
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, jsonDecode(e.toString())['message']);
      }
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String fullName,
    required String phoneNumber,
    required String password,
    required String gender,
    required String address,
    required String role,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/auth/register'),
        body: jsonEncode({
          'fullName': fullName,
          'phone': phoneNumber,
          'password': password,
          'gender': gender,
          'address': address,
          'role': role,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // print(jsonDecode(res.body)['message']);
      if (res.statusCode == 201) {
        Navigator.pushNamed(context, MainPage.routeName);
      } else {
        showSnackBar(context, jsonDecode(res.body)['message']);
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, jsonDecode(e.toString()));
      }
    }
  }
}
