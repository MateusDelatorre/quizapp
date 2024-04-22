import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/presentation/quiz/bloc/quiz_bloc.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Text(state.questionnaire.questions[state.currentQuestionIndex].question),
                for (var alternative in state.questionnaire.questions[state.currentQuestionIndex].alternatives)
                  Text(alternative),
                ElevatedButton(
                  onPressed: () {
                    // Add logic to handle the answer
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          );
        }
    );
  }
}
