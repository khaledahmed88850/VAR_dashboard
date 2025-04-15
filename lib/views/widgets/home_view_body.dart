import 'package:flutter/material.dart';
import 'package:var_dashboard/views/password_questions_view.dart';
import 'package:var_dashboard/views/risk_questions_view.dart';

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
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.routeName,
  });
  final String text;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 156, 54, 47),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
