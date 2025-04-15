import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/data/cubits/password_questions_cubit.dart/password_questions_cubit.dart';
import 'package:var_dashboard/models/password_questions_model.dart';

import '../widgets/custom_text_field.dart';

class PasswordQuestionsView extends StatefulWidget {
  const PasswordQuestionsView({super.key});
  static const routeName = '/password-questions';

  @override
  State<PasswordQuestionsView> createState() => _PasswordQuestionsViewState();
}

class _PasswordQuestionsViewState extends State<PasswordQuestionsView> {
  late String name, url;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final textField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Questions'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 138, 221, 224),
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
                  onSubmitted: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  labelText: 'wikipedia Url',
                  onSubmitted: (value) {
                    url = value;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 156, 54, 47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    textField.clear();
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      PasswordQuestionsModel passwordQuestionsModel =
                          PasswordQuestionsModel(name: name, url: url);
                      context
                          .read<PasswordQuestionsCubit>()
                          .addPasswordQuestions(
                            passwordQuestionModel: passwordQuestionsModel,
                          );
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
