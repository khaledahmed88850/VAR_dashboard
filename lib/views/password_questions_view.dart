import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/data/cubits/password_questions_cubit.dart/password_questions_cubit.dart';

import '../widgets/custom_text_field.dart';

class PasswordQuestionsView extends StatefulWidget {
  const PasswordQuestionsView({super.key});
  static const routeName = '/password-questions';

  @override
  State<PasswordQuestionsView> createState() => _PasswordQuestionsViewState();
}

class _PasswordQuestionsViewState extends State<PasswordQuestionsView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Questions'),
        centerTitle: true,
        backgroundColor: const Color(0x878ADDE0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 120),
                CustomTextField(
                  labelText: 'Player name',
                  controller: context.read<PasswordQuestionsCubit>().playerName,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  labelText: 'wikipedia Url',
                  controller: context.read<PasswordQuestionsCubit>().url,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x878ADDE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<PasswordQuestionsCubit>()
                          .addPasswordQuestions();
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Player Added')));
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
