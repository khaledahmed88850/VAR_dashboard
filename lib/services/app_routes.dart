import 'package:flutter/material.dart';
import 'package:var_dashboard/data/cubits/Who_am_i_questions_cubit/who_am_i_questions_cubit.dart';
import 'package:var_dashboard/data/cubits/bank_questions_cubit/bank_questions_cubit.dart';
import 'package:var_dashboard/data/cubits/password_questions_cubit.dart/password_questions_cubit.dart';
import 'package:var_dashboard/data/cubits/risk_questions_cubit/risk_questions_cubit.dart';
import 'package:var_dashboard/data/repo/bank_challenge_repo.dart';
import 'package:var_dashboard/data/repo/password_challenge_repo.dart';
import 'package:var_dashboard/data/repo/risk_challenge_repo.dart';
import 'package:var_dashboard/data/repo/whoami_challenge_repo.dart';
import 'package:var_dashboard/services/dependency_injection.dart';
import 'package:var_dashboard/views/bank_questions_view.dart';
import 'package:var_dashboard/views/home_view.dart';
import 'package:var_dashboard/views/password_questions_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/views/risk_questions_view.dart';
import 'package:var_dashboard/views/whoami_question_view.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case RiskQuestionsView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) => RiskQuestionsCubit(getIt<RiskChallengeRepo>()),
              child: RiskQuestionsView(),
            ),
      );
    case PasswordQuestionsView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) =>
                      PasswordQuestionsCubit(getIt<PasswordChallengeRepo>()),
              child: const PasswordQuestionsView(),
            ),
      );
    case BankQuestionsView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) => BankQuestionsCubit(getIt<BankChallengeRepo>()),
              child: const BankQuestionsView(),
            ),
      );
    case WhoamiQuestionView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => BlocProvider(
              create:
                  (context) =>
                      WhoAmIQuestionsCubit(getIt<WhoamiChallengeRepo>()),
              child: const WhoamiQuestionView(),
            ),
      );
    default:
      return null;
  }
}
