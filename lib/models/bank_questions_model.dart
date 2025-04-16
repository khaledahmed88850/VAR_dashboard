class BankQuestionsModel {
  final String question;
  final String answer;

  BankQuestionsModel({required this.question, required this.answer});
  toJson() => {'question': question, 'answer': answer};
}
