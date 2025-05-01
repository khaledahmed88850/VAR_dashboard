class WhoamiQuestionsModel {
  final String clue1;
  final String clue2;
  final String clue3;
  final String clue4;
  final String clue5;
  final String answer;
  final num random;
  WhoamiQuestionsModel({
    required this.random,
    required this.clue1,
    required this.clue2,
    required this.clue3,
    required this.clue4,
    required this.clue5,
    required this.answer,
  });
  toJson() {
    return {
      'random': random,
      'clue1': clue1,
      'clue2': clue2,
      'clue3': clue3,
      'clue4': clue4,
      'clue5': clue5,
      'answer': answer,
    };
  }
}
