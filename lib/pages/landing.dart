import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controllers/question.controller.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Get.find<QuestionController>().populateQuestions(),
        builder: (context, snapshot) {
          return Center(
            child: ElevatedButton(onPressed: (){
              Get.to(HomePage());
            }, child: Text("Start")),
          );
        }
      ),
    );
  }
}