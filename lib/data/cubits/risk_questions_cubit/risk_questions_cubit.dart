import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:var_dashboard/data/repo/risk_challenge_repo.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/models/risk_questions_model.dart';
import 'package:var_dashboard/utils/firestore_endpoints.dart';

part 'risk_questions_state.dart';

class RiskQuestionsCubit extends Cubit<RiskQuestionsState> {
  RiskQuestionsCubit(this.riskChallengeRepo) : super(RiskQuestionsInitial());
  final RiskChallengeRepo riskChallengeRepo;
  TextEditingController question1 = TextEditingController();
  TextEditingController question2 = TextEditingController();
  TextEditingController question3 = TextEditingController();
  TextEditingController question4 = TextEditingController();
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  Future<void> addRiskQuestions() async {
    emit(RiskQuestionsLoading());
    try {
      RiskQuestionsModel riskQuestionModel = RiskQuestionsModel(
        question1: question1.text,
        question2: question2.text,
        question3: question3.text,
        question4: question4.text,
        answer1: answer1.text,
        answer2: answer2.text,
        answer3: answer3.text,
        answer4: answer4.text,
        name: categoryName.text,
      );
      await riskChallengeRepo.addData(
        data: riskQuestionModel.toJson(),
        path: FirestoreEndpoints.riskChallenge,
      );
      clearControllerText();
      emit(RiskQuestionsSuccess());
    } on Customexception catch (e) {
      clearControllerText();
      emit(RiskQuestionsFailure(message: e.message));
    }
  }

  void clearControllerText() {
    question1.clear();
    question2.clear();
    question3.clear();
    question4.clear();
    answer1.clear();
    answer2.clear();
    answer3.clear();
    answer4.clear();
    categoryName.clear();
  }
}
