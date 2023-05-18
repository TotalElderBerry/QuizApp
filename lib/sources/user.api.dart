import 'package:http/http.dart' as http;
import 'package:quiz_app/constants/api.dart';

class UserAPI{

  Future<void> login(String username, String password) async {
    //gets the endpoint of all questions
    String endpoint = "${APIConstants.baseUrl}login";

    final response = await http.post(Uri.parse(endpoint),
    headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: <String,String>{
        "username": username,
        "password": password
      }
    );

    if(response.statusCode == 200){
      print("Login successful");
    }else{
      print("Login failed");
    }
    
  }
}