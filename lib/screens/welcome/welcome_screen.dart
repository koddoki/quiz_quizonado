import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quizonado/constants.dart';
import 'package:quiz_quizonado/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg",
            width:  MediaQuery.of(context).size.width,
            fit : BoxFit.cover,
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Text(
                "Ta na hora do Quiz!",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text("Preparado?"),
              Spacer(),
              InkWell(
                onTap: () => Get.to(QuizScreen()),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kDefaultPadding * 0.75),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text("Bora pro Joguinho!"),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ))
      ],
    ));
  }
}
