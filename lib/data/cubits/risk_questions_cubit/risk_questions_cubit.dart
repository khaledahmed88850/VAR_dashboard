import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:var_dashboard/data/repo/risk_challenge_repo.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/models/risk_questions_model.dart';
import 'package:var_dashboard/utils/firestore_endpoints.dart';

part 'risk_questions_state.dart';

class RiskQuestionsCubit extends Cubit<RiskQuestionsState> {
  RiskQuestionsCubit(this.riskChallengeRepo) : super(RiskQuestionsInitial());
  final RiskChallengeRepo riskChallengeRepo;
  Future<void> addRiskQuestions({
    required RiskQuestionsModel riskQuestionModel,
  }) async {
    emit(RiskQuestionsLoading());
    try {
      await riskChallengeRepo.addData(
        data: riskQuestionModel.toJson(),
        path: FirestoreEndpoints.riskChallenge,
      );
      emit(RiskQuestionsSuccess());
    } on Customexception catch (e) {
      emit(RiskQuestionsFailure(message: e.message));
    }
  }
}
