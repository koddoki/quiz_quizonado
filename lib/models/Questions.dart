class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter é um software open-source desenvolvido pela...",
    "options": ['Apple', 'Microsoft', 'Google', 'Sony'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question":
        "Qual professor(a) está conduzindo o PAC da quarta fase da Engenharia de Software?",
    "options":['Manfred','Tassiana','Mauricio','NdA'],
    "answer_index":1,
  },

  {
    "id": 3,
    "question":
    "Complete: O brasil é o ... maior país do mundo.",
    "options":['5º','3º','8º','1º'],
    "answer_index":0,
  },
  {
    "id": 4,
    "question":
    "O baralho de truco tem quantas cartas?",
    "options":['22','40','28','52'],
    "answer_index":1,
  },
  {
    "id": 5,
    "question":
    "Como que você quebrou o cano?",
    "options":['Que cano? ','Brincando','Qual Cano?','Quicando.'],
    "answer_index":2,
  },
];
