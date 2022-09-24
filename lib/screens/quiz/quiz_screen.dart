import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quizonado/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          // Botão que quando pressionado pula para a próxima pergunta
          TextButton(onPressed: _controller.nextQuestion, child: Text("Pular", style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Body(),
    );
  }
}

