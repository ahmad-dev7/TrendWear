import 'dart:io';
import 'package:flutter/material.dart';
class ApiConfig {
  String getBaseUrl (){
     if(!Platform.isWindows){
   return  '192.168.0.103:3000';
  }
  else{
   return  'http://localhost:3000';
  }
  }
String baseUrl;

  void 
 
  
  String get signup => '$baseUrl/signup';
  String get login => '$baseUrl/login';
}
