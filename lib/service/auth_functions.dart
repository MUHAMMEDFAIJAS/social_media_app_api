import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_test_1/model/authentication_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio = Dio();

  Future<AuthenticationModel?> signup(
      BuildContext context, AuthenticationModel authModel) async {
    try {
      final response = await dio.post(
          'https://social-media-5ukj.onrender.com/auth/register',
          options: Options(headers: {"Content-Type": "application/json"}),
          data: authModel.toJson());
      if (response.statusCode == 201) {
        log('account created');
        final jsndata = AuthenticationModel.fromJson(response.data);
        return jsndata;
      }
    } catch (e) {
      throw Exception('unable to create account $e');
    }
    return null;
  }

  Future<String> login(
      BuildContext context, AuthenticationModel authmodel) async {
    try {
      final response = await dio.post(
          "https://social-media-5ukj.onrender.com/auth/login",
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: authmodel.toJson());
      // if (response.statusCode == 200) {
      //   log("login success");

      if (response.statusCode == 200) {
        log('login sucess');

        final jsndata = response.data as Map<String, dynamic>;
        String token = jsndata['token'];
        String status = jsndata['status'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('Token', token);
        pref.setString('status', status);
        return status;
      } else {
        log('user not found');
        throw Exception('user not found ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }

  Future<UserModel?> getLoggedUser(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('Token');
      final response = await dio.get(
        'https://social-media-5ukj.onrender.com/auth/loggeduser',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = UserModel.fromJson(response.data);
        return jsonData;
      } else {
        log('Failed to  login: ${response.statusCode}');
        throw Exception('failed to get logged in user');
      }
    } catch (e) {
      log('somethimng went wrong');
      throw Exception('something went wrong $e');
    }
  }
}
