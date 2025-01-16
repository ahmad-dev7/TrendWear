import 'dart:io';

class ApiConfig {
  String baseUrl = getBaseUrl();

  String get signup => '$baseUrl/signup';
  String get login => '$baseUrl/login';
}

String getBaseUrl() {
  if (!Platform.isWindows) {
    return '192.168.0.103:3000';
  } else {
    return 'http://localhost:3000';
  }
}
