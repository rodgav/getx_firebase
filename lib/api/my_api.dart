import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/auth.dart';
import 'package:getx_firebase/models/app_user.dart';

class MyApi {
  MyApi._internal();

  static MyApi _instance = MyApi._internal();

  static MyApi get instance => _instance;

  final _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.33:7001',
  ));

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio
          .post('/login', data: {'email': email, 'password': password});
      return response.data;
    } catch (e) {
      if (e is DioError)
       await Get.dialog(AlertDialog(
          title: Text('Error'),
          content: Text(e.response!.data),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Aceptar'))
          ],
        ));
      return null;
    }
  }

  Future<AppUser?> getUserInfo() async {
    try {
      final idToken = await AuthController.instance.idToken;
      final response = await _dio.get('/get-user-info',
          options: Options(headers: {'token': idToken}));
      return AppUser.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
