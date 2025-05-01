part of 'who_am_i_questions_cubit.dart';

@immutable
sealed class WhoAmIQuestionsState {}

final class WhoAmIQuestionsInitial extends WhoAmIQuestionsState {}

final class WhoAmIQuestionsLoading extends WhoAmIQuestionsState {}

final class WhoAmIQuestionsSuccess extends WhoAmIQuestionsState {}

final class WhoAmIQuestionsFailure extends WhoAmIQuestionsState {
  final String message;
  WhoAmIQuestionsFailure({required this.message});
}
