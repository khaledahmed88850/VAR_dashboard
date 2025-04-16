import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/data/cubits/bank_questions_cubit/bank_questions_cubit.dart';
import 'package:var_dashboard/widgets/custom_text_field.dart';

class BankQuestionsView extends StatefulWidget {
  const BankQuestionsView({super.key});
  static const String routeName = '/bank-questions';

  @override
  State<BankQuestionsView> createState() => _BankQuestionsViewState();
}

class _BankQuestionsViewState extends State<BankQuestionsView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Questions'),
        centerTitle: true,
        backgroundColor: const Color(0xFFD5AA46),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 100),
                CustomTextField(
                  labelText: 'Question',
                  controller: context.read<BankQuestionsCubit>().question,
                ),
                SizedBox(height: 50),
                CustomTextField(
                  labelText: 'Answer',
                  controller: context.read<BankQuestionsCubit>().answer,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD5AA46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<BankQuestionsCubit>().addBankQuestions();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('question added')),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black, fontSize: 16),
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
