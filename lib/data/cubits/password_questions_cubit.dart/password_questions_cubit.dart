import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:var_dashboard/data/repo/password_challenge_repo.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/models/password_questions_model.dart';
import 'package:var_dashboard/utils/firestore_endpoints.dart';

part 'password_questions_state.dart';

class PasswordQuestionsCubit extends Cubit<PasswordQuestionsState> {
  PasswordQuestionsCubit(this.passwordChallengeRepo)
    : super(PasswordQuestionsInitial());
  final PasswordChallengeRepo passwordChallengeRepo;

  Future<void> addPasswordQuestions({
    required PasswordQuestionsModel passwordQuestionModel,
  }) async {
    emit(PasswordQuestionsLoading());
    try {
      await passwordChallengeRepo.addData(
        data: passwordQuestionModel.toJson(),
        path: FirestoreEndpoints.passwordChallenge,
      );
      emit(PasswordQuestionsSuccess());
    } on Customexception catch (e) {
      emit(PasswordQuestionsFailure(message: e.message));
    }
  }
}
