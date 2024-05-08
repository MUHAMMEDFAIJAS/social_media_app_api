import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_test_1/model/users_model.dart';
import 'package:insta_clone_test_1/service/auth_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userservice {
  static Future<List<UsersModel>> fetchallusers() async {
    Dio dio = Dio();
    try {
      final response =
          await dio.get('https://social-media-5ukj.onrender.com/user/');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => UsersModel.fromJson(item)).toList();
      } else {
        throw Exception('unable to load data');
      }
    } catch (e) {
      return throw Exception("error in fetching ");
    }
  }

  Future<void> followUser(BuildContext context, String id) async {
    final loggeduser = await AuthService().getLoggedUser(context);

    final loggedId = loggeduser!.id;

    Dio dio = Dio();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('Token');
    final data = {"_id": id};
    try {
      final response = await dio.put(
          'https://social-media-5ukj.onrender.com/user/$loggedId/follow',
          data: jsonEncode(data),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));

      if (response.statusCode == 200) {
        log('followed');
      } else {
        log('unable to follow');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> unfollowuser(context, String id) async {
    final loggedUser = await AuthService().getLoggedUser(context);

    final loggedId = loggedUser!.id;

    Dio dio = Dio();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('Token');
    final data = {"_id": id};

    try {
      // give the unfollow api

      final respnse = await dio.put(
          'https://social-media-5ukj.onrender.com/user/$loggedId/unfollow',
          data: jsonEncode(data),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (respnse.statusCode == 200) {
        log('Unfollowed');
      } else {
        log('unable to unfollow');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
