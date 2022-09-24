import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quizonado/constants.dart';
import 'package:quiz_quizonado/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const Spacer(flex: 3,),
              Text("Pontuação Final: ",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kSecondaryColor)),
              const Spacer(flex: 2,),
              Text("${_qnController.numOfCorrectAns*10}/${_qnController.questions.length*10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: kSecondaryColor)),
              const Spacer(flex:3),
            ],
          ),
        ],
      ),
    );
  }
}
