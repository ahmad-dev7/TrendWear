import 'dart:io';

class ApiConfig {
  late String baseUrl;
  if(!Platform.isWindows){
    baseUrl = '192.168.0.103:3000';
  }
  else{
    baseUrl = 'http://localhost:3000';
  }
  
  String get signup => '$baseUrl/signup';
  String get login => '$baseUrl/login';
}
