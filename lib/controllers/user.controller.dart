import 'dart:convert';

import 'package:get/get.dart';
import 'package:quiz_app/models/user.model.dart';

import '../sources/user.api.dart';

class UserController extends GetxController{

  final currentUser = Rxn<User>();

  Future<bool> loginStudent(String idNumber) async {
    final response = await UserAPI().login(idNumber);
    if(response != false){
      print("llgin success");
      currentUser.value = User.fromJson(response);
      return true;
    }else{
      print("llgin failed");
      return false;
    }
  }

}