part of 'password_questions_cubit.dart';

@immutable
sealed class PasswordQuestionsState {}

final class PasswordQuestionsInitial extends PasswordQuestionsState {}

final class PasswordQuestionsLoading extends PasswordQuestionsState {}

final class PasswordQuestionsSuccess extends PasswordQuestionsState {}

final class PasswordQuestionsFailure extends PasswordQuestionsState {
  final String message;

  PasswordQuestionsFailure({required this.message});
}
