class RiskQuestionsModel {
  final String name;
  final String question1;
  final String question2;
  final String question3;
  final String question4;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;

  RiskQuestionsModel({
    required this.name,
    required this.question1,
    required this.question2,
    required this.question3,
    required this.question4,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });
  toJson() {
    return {
      'name': name,
      'question1': question1,
      'question2': question2,
      'question3': question3,
      'question4': question4,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
    };
  }
}
