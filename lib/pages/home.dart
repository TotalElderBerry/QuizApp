import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question.controller.dart';

import '../models/question.model.dart';
import 'congratulation.dart';


class HomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<HomePage> {
  final List<Question> questions = Get.find<QuestionController>().questions;

  int currentIndex = 0;
  PageController _pageController = PageController();

  List<int> selectedChoices = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void selectChoice(int choiceIndex) {
    setState(() {
      selectedChoices[currentIndex] = choiceIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedChoices = List<int>.filled(questions.length, -1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.colorScheme.background.withOpacity(0.0001);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                          padding: EdgeInsets.all(16.0),
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: cardColor.withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 4.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                questions[index].qUESTION!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: questions[index].choices.length,
                                itemBuilder: (context, choiceIndex) {
                                  print(questions[index].choices.length);
                                  final choice = questions[index].choices[choiceIndex];
                                  print(choice);
                                  final isSelected = selectedChoices[index] == choiceIndex;
                                  return GestureDetector(
                                    onTap: () => selectChoice(choiceIndex),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      margin: const EdgeInsets.only(bottom: 8.0),
                                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: isSelected ? theme.primaryColor : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: theme.primaryColor,
                                          width: isSelected ? 0.0 : 1.0,
                                        ),
                                      ),
                                      child: Text(
                                        choice,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: isSelected ? Colors.white : theme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentIndex > 0)
                          ElevatedButton(
                            onPressed: previousPage,
                            child: Text('Previous'),
                          ),
                        if (currentIndex < questions.length - 1)
                          ElevatedButton(
                            onPressed: nextPage,
                            child: Text('Next'),
                          ),
                        if (currentIndex == questions.length - 1)
                          ElevatedButton(
                            onPressed: () {
                              // Handle quiz submission
                              Get.to(CongratulatoryPage());
                            },
                            child: Text('Submit'),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
