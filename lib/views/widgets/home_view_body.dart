import 'package:flutter/material.dart';
import 'package:var_dashboard/views/bank_questions_view.dart';
import 'package:var_dashboard/views/password_questions_view.dart';
import 'package:var_dashboard/views/risk_questions_view.dart';
import 'package:var_dashboard/views/whoami_question_view.dart';
import 'package:var_dashboard/widgets/custom_text_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          text: 'Password Questions',
          routeName: PasswordQuestionsView.routeName,
        ),
        SizedBox(height: 12),
        CustomTextButton(
          text: 'Risk Questions',
          routeName: RiskQuestionsView.routeName,
        ),
        SizedBox(height: 12),
        CustomTextButton(
          text: 'Bank Questions',
          routeName: BankQuestionsView.routeName,
        ),
        SizedBox(height: 12),
        CustomTextButton(
          text: 'Who Am I Questions',
          routeName: WhoamiQuestionView.routeName,
        ),
      ],
    );
  }
}
