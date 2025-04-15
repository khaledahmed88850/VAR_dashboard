part of 'risk_questions_cubit.dart';

@immutable
sealed class RiskQuestionsState {}

final class RiskQuestionsInitial extends RiskQuestionsState {}

final class RiskQuestionsLoading extends RiskQuestionsState {}

final class RiskQuestionsSuccess extends RiskQuestionsState {}

final class RiskQuestionsFailure extends RiskQuestionsState {
  final String message;
  RiskQuestionsFailure({required this.message});
}
