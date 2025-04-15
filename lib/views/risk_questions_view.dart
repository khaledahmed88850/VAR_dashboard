import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/data/cubits/risk_questions_cubit/risk_questions_cubit.dart';
import 'package:var_dashboard/models/risk_questions_model.dart';
import 'package:var_dashboard/widgets/custom_text_field.dart';

class RiskQuestionsView extends StatefulWidget {
  const RiskQuestionsView({super.key});
  static const routeName = '/risk-questions';

  @override
  State<RiskQuestionsView> createState() => _PasswordQuestionsViewState();
}

class _PasswordQuestionsViewState extends State<RiskQuestionsView> {
  late String name,
      question1,
      answer1,
      question2,
      answer2,
      question3,
      answer3,
      question4,
      answer4;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final textField = TextEditingController();
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
                      onSubmitted: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 1',
                      onSubmitted: (value) {
                        question1 = value;
                      },
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 1',
                      onSubmitted: (value) {
                        answer1 = value;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 2',
                      onSubmitted: (value) {
                        question2 = value;
                      },
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 2',
                      onSubmitted: (value) {
                        answer2 = value;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 3',
                      onSubmitted: (value) {
                        question3 = value;
                      },
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 3',
                      onSubmitted: (value) {
                        answer3 = value;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Question 4',
                      onSubmitted: (value) {
                        question4 = value;
                      },
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Answer 4',
                      onSubmitted: (value) {
                        answer4 = value;
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
                          RiskQuestionsModel model = RiskQuestionsModel(
                            name: name,
                            question1: question1,
                            answer1: answer1,
                            question2: question2,
                            answer2: answer2,
                            question3: question3,
                            answer3: answer3,
                            question4: question4,
                            answer4: answer4,
                          );
                          context.read<RiskQuestionsCubit>().addRiskQuestions(
                            riskQuestionModel: model,
                          );
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
