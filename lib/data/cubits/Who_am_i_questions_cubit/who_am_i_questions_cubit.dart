import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:var_dashboard/data/repo/whoami_challenge_repo.dart';
import 'package:var_dashboard/errors/exceptions.dart';
import 'package:var_dashboard/models/whoami_questions_model.dart';

part 'who_am_i_questions_state.dart';

class WhoAmIQuestionsCubit extends Cubit<WhoAmIQuestionsState> {
  WhoAmIQuestionsCubit(this.whoamiChallengeRepo)
    : super(WhoAmIQuestionsInitial());
  final WhoamiChallengeRepo whoamiChallengeRepo;
  TextEditingController answer = TextEditingController();
  TextEditingController clue1 = TextEditingController();
  TextEditingController clue2 = TextEditingController();
  TextEditingController clue3 = TextEditingController();
  TextEditingController clue4 = TextEditingController();
  TextEditingController clue5 = TextEditingController();

  Future<void> addData() async {
    emit(WhoAmIQuestionsLoading());
    try {
      final random = Random().nextDouble();
      WhoamiQuestionsModel whoamiQuestionsModel = WhoamiQuestionsModel(
        answer: answer.text,
        clue1: clue1.text,
        clue2: clue2.text,
        clue3: clue3.text,
        clue4: clue4.text,
        clue5: clue5.text,
        random: random,
      );
      await whoamiChallengeRepo.addData(data: whoamiQuestionsModel.toJson());

      clearControllerText();

      emit(WhoAmIQuestionsSuccess());
    } on Customexception catch (e) {
      clearControllerText();
      emit(WhoAmIQuestionsFailure(message: e.message));
    }
  }

  void clearControllerText() {
    answer.clear();
    clue1.clear();
    clue2.clear();
    clue3.clear();
    clue4.clear();
    clue5.clear();
  }
}
