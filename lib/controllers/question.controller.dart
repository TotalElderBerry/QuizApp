import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/question.model.dart';

import '../sources/question.api.dart';

class QuestionController extends GetxController{
  RxBool isPopulated = false.obs;
  RxList<Question> questions =  <Question>[
    // Add more questions here
  ].obs;

  void addQuestion(Question question){
    questions.add(question);
  }

  Future<bool> populateQuestions()async{
    questions.clear();
    final response = await QuestionAPI().getAllQuestions();
    for(int i = 0; i < response.length; i++){
      Question question = Question().fromJson(response[i]);
      questions.add(question);
    }
    isPopulated.value = true;
    return true;
  }

}