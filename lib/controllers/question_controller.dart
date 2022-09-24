import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_quizonado/models/Questions.dart';
import 'package:quiz_quizonado/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    // chama isso depois que o controller é deletado da memória
    @override
    void onClose() {
      super.onClose();

      _animationController.dispose();
      _pageController.dispose();
    }

    // Começa a animação
    // Depois que da os 30s ela pula pra proxima automaticamente
    _animationController.forward().whenComplete(nextQuestion);

    // PRA ESSA MISERA NÃO EXPLODIR O MEU APLICATIVO :)
    _pageController = PageController();
    super.onInit();
  }

  void checkAns(Question question, int selectedIndex) {
    // Quando o usuário selecionar qualquer opção isso vira true
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns)
      _numOfCorrectAns++; // se a condição ta certa, jogador ganha pontos

    // Para a animação
    _animationController.stop();
    update();

    // Depois de 3 segundos que a pessoa escolher uma resposta vai mudar automaticamente pra próxima pergunta
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reseta o temporizador
      _animationController.reset();

      // Quando o tempo acaba ou seleciona a resposta, vai pra proxima
      _animationController.forward().whenComplete(nextQuestion);
    }

    else {
      Get.to(ScoreScreen());
    }

  }

  void updateTheQnNum(int index){
    _questionNumber.value = index + 1;

  }
}