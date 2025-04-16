import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:var_dashboard/data/repo/bank_challenge_repo.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/models/bank_questions_model.dart';
import 'package:var_dashboard/utils/firestore_endpoints.dart';

part 'bank_questions_state.dart';

class BankQuestionsCubit extends Cubit<BankQuestionsState> {
  BankQuestionsCubit(this.bankChallengeRepo) : super(BankQuestionsInitial());
  final BankChallengeRepo bankChallengeRepo;
  TextEditingController question = TextEditingController();
  TextEditingController answer = TextEditingController();
  Future<void> addBankQuestions() async {
    emit(BankQuestionsLoading());
    try {
      BankQuestionsModel bankQuestionsModel = BankQuestionsModel(
        question: question.text,
        answer: answer.text,
      );
      await bankChallengeRepo.addData(
        data: bankQuestionsModel.toJson(),
        path: FirestoreEndpoints.bankChallenge,
      );
      clearControllerText();
      emit(BankQuestionsSuccess());
    } on Customexception catch (e) {
      clearControllerText();
      emit(BankQuestionsFailure(message: e.message));
    }
  }

  void clearControllerText() {
    question.clear();
    answer.clear();
  }
}
