import 'package:flutter/material.dart';
import 'package:user_list/models/user_list.dart';
import 'package:user_list/service/api_service.dart';

class UserProvider with  ChangeNotifier{
  bool isLoading = false;
  UserList response = UserList();
  getData(context) async{
    isLoading=true;
    response = (await getUserData(context))!;
    isLoading = false;
    notifyListeners();
  }
}