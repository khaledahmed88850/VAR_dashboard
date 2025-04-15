import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/data/cubits/risk_questions_cubit/risk_questions_cubit.dart';
import 'package:var_dashboard/widgets/custom_text_field.dart';

class RiskQuestionsView extends StatefulWidget {
  const RiskQuestionsView({super.key});
  static const routeName = '/risk-questions';

  @override
  State<RiskQuestionsView> createState() => _PasswordQuestionsViewState();
}

class _PasswordQuestionsViewState extends State<RiskQuestionsView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Risk Questions'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 138, 221, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    CustomTextField(
                      labelText: 'Category name',
                      controller:
                          context.read<RiskQuestionsCubit>().categoryName,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 1',
                      controller: context.read<RiskQuestionsCubit>().question1,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 1',
                      controller: context.read<RiskQuestionsCubit>().answer1,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 2',
                      controller: context.read<RiskQuestionsCubit>().question2,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 2',
                      controller: context.read<RiskQuestionsCubit>().answer2,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 3',
                      controller: context.read<RiskQuestionsCubit>().question3,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 3',
                      controller: context.read<RiskQuestionsCubit>().answer3,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 4',
                      controller: context.read<RiskQuestionsCubit>().question4,
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 4',
                      controller: context.read<RiskQuestionsCubit>().answer4,
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<RiskQuestionsCubit>().addRiskQuestions();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Category Added')),
                          );
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
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
