import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:var_dashboard/data/repo/password_challenge_repo.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/models/password_questions_model.dart';
import 'package:var_dashboard/utils/firestore_endpoints.dart';

part 'password_questions_state.dart';

class PasswordQuestionsCubit extends Cubit<PasswordQuestionsState> {
  PasswordQuestionsCubit(this.passwordChallengeRepo)
    : super(PasswordQuestionsInitial());
  final PasswordChallengeRepo passwordChallengeRepo;
  TextEditingController playerName = TextEditingController();
  TextEditingController url = TextEditingController();
  Future<void> addPasswordQuestions() async {
    emit(PasswordQuestionsLoading());
    try {
      PasswordQuestionsModel passwordQuestionModel = PasswordQuestionsModel(
        name: playerName.text,
        url: url.text,
      );
      await passwordChallengeRepo.addData(
        data: passwordQuestionModel.toJson(),
        path: FirestoreEndpoints.passwordChallenge,
      );
      clearControllerText();
      emit(PasswordQuestionsSuccess());
    } on Customexception catch (e) {
      clearControllerText();
      emit(PasswordQuestionsFailure(message: e.message));
    }
  }

  void clearControllerText() {
    playerName.clear();
    url.clear();
  }
}
