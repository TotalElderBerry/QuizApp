import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/controllers/user.controller.dart';
import 'package:quiz_app/models/question.model.dart';

import '../models/user.model.dart';
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

  void submitAnswer(int questionno, String answer){
    String? currentUser = Get.find<UserController>().currentUser.value!.idno;
    print("in question $questionno with answer $answer");
    if(currentUser != null){
      final response = QuestionAPI().submitAnswer(currentUser,questionno,answer);
    }
  }


  Future<String> checkAnswers() async {
    String? currentUser = Get.find<UserController>().currentUser.value!.idno;

    final score = await QuestionAPI().checkAnswers(currentUser!);
    return score;
  }


}