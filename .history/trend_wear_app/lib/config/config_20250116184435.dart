import 'dart:io';

class ApiConfig {
  String baseUrl = 'http://192.168.0.103:3000';

  String get signup => '$baseUrl/signup';
  String get login => '$baseUrl/login';
}
