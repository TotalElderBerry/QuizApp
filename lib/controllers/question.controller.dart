import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/question.model.dart';

class QuestionController extends GetxController{
  RxList<Question> questions =  [
    Question(
      id: 1,
      question: 'What is the capital of France?',
      choices: ['Paris', 'Madrid', 'Berlin', 'London'],
    ),
    Question(
      id: 2,
      question: 'Who painted the Mona Lisa?',
      choices: ['Leonardo da Vinci', 'Vincent van Gogh', 'Pablo Picasso', 'Michelangelo'],
    ),
    // Add more questions here
  ].obs;

  void addQuestion(Question question){
    questions.add(question);
  }

}