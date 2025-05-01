import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:var_dashboard/data/cubits/Who_am_i_questions_cubit/who_am_i_questions_cubit.dart';
import 'package:var_dashboard/widgets/custom_text_field.dart';

class WhoamiQuestionView extends StatefulWidget {
  const WhoamiQuestionView({super.key});
  static const String routeName = '/whoami-question-view';

  @override
  State<WhoamiQuestionView> createState() => _WhoamiQuestionViewState();
}

class _WhoamiQuestionViewState extends State<WhoamiQuestionView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who Am I Questions'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2A2098),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 80),
                CustomTextField(
                  labelText: 'Player Name',
                  controller: context.read<WhoAmIQuestionsCubit>().answer,
                ),
                SizedBox(height: 70),
                CustomTextField(
                  labelText: 'Clue 1',
                  controller: context.read<WhoAmIQuestionsCubit>().clue1,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Clue 2',
                  controller: context.read<WhoAmIQuestionsCubit>().clue2,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Clue 3',
                  controller: context.read<WhoAmIQuestionsCubit>().clue3,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Clue 4',
                  controller: context.read<WhoAmIQuestionsCubit>().clue4,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Clue 5',
                  controller: context.read<WhoAmIQuestionsCubit>().clue5,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A2098),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<WhoAmIQuestionsCubit>().addData();
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
