part of 'bank_questions_cubit.dart';

@immutable
sealed class BankQuestionsState {}

final class BankQuestionsInitial extends BankQuestionsState {}

final class BankQuestionsLoading extends BankQuestionsState {}

final class BankQuestionsSuccess extends BankQuestionsState {}

final class BankQuestionsFailure extends BankQuestionsState {
  final String message;
  BankQuestionsFailure({required this.message});
}
