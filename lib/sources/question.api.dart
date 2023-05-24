import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api.dart';

class QuestionAPI {


  Future<dynamic> getAllQuestions() async {
    //gets the endpoint of all questions
    String endpoint = "${APIConstants.baseUrl}/getquestions";

    final response = await http.get(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Fetched Questions");
      return jsonDecode(response.body);
    } else {
      print("Fetching questions failed");
    }
  }

  void submitAnswer(String idno,int questionno,  String answer) async {
    String endpoint = "${APIConstants.baseUrl}/passanswer?username=$idno&questionno=$questionno&answer=$answer";

    final response = await http.get(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Fetched Questions");
      return jsonDecode(response.body);
    } else {
      print("Fetching questions failed");
    }
  }

  Future<String> checkAnswers(String idno) async {
    String endpoint = "${APIConstants.baseUrl}/checkanswer?username=$idno";

    final response = await http.get(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Fetched Questions");

      return response.body;
    } else {
      return '';
    }
  }
}
