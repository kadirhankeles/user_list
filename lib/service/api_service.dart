import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:user_list/models/user_list.dart';

Future<UserList?> getUserData(context) async{
  UserList userResponse;
  try {
    final response =  await Dio().get("https://reqres.in/api/users?page=2");
    userResponse = UserList.fromJson(response.data);
    return userResponse;
  }catch(e) {
    log(e.toString());
  }
}