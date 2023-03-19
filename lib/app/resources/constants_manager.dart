import 'package:flutter/foundation.dart';

class Constant {
  static const String baseUrl = 'https://backend-shop-apps.herokuapp.com/api';
}

class EndPoints {
  static const String registerUrl = '/user/signup';
  static const String signInUrl = '/user/login';
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}
