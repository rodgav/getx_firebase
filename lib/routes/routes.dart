import 'package:flutter/material.dart';
import 'package:getx_firebase/pages/home.dart';
import 'package:getx_firebase/pages/login.dart';
import 'package:getx_firebase/pages/register.dart';
import 'package:getx_firebase/pages/splash.dart';
import 'package:getx_firebase/routes/route_names.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RouteNames.SPLASH: (_) => SplashPage(),
  RouteNames.LOGIN: (_) => LoginPage(),
  RouteNames.REGISTER: (_) => RegisterPage(),
  RouteNames.HOME: (_) => HomePage(),
};