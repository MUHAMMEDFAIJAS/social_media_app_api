import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insta_clone_test_1/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSignup {
  final Dio dio = Dio();


  Future<UserDataModel?> signup(SignupModel signupmodel) async {
    try {
      final response = await dio.post(
        'https://social-media-5ukj.onrender.com/auth/register',
        data: signupmodel.toJson(),
          // options: Options(headers: {"Content-Type": "application/json"})
      );
      if (response.statusCode == 201) {
        log('register successful');
        final data = UserDataModel.fromSJon(response.data);
        return data;
      } else {
        print('request failed ${response.statusCode}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> login(SignupModel singnupmodel) async {
    try {
      final response = await dio.post(
          "https://social-media-5ukj.onrender.com/auth/login",
          data: singnupmodel.toJson());
      if (response.statusCode == 200) {
        log("login success");
        final responseData = response.data;
        String token = responseData["token"];
        String status = responseData["status"];
        SharedPreferences prf = await SharedPreferences.getInstance();
        prf.setString("Token", token);
        prf.setString("Status", status);
        return status;
      } else {
        print('login Faild ${response.statusCode}');
        return 'user not found';
      }
    } catch (e) {
      print('$e');
      return 'Something went wrong';
    }
  }
}
