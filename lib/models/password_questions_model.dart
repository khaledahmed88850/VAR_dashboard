class PasswordQuestionsModel {
  final String name;
  final String url;

  PasswordQuestionsModel({required this.name, required this.url});

  toJson() => {'name': name, 'url': url};
}
