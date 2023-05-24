import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/constants/api.dart';

class UserAPI{

  Future<Map<String, dynamic>> login(String idNumber) async {
    //gets the endpoint of all questions
    String endpoint = "${APIConstants.baseUrl}login?password=$idNumber";

    final response = await http.get(Uri.parse(endpoint),
    headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      return <String,String>{
        'message': 'failed'
      };
    }
    
  }
}