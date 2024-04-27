import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/presentation/quiz/bloc/quiz_bloc.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if(state.status == QuizStatus.loading){
            return CircularProgressIndicator();
          } else if(state.status == QuizStatus.success){
            return Scaffold(
              body: Column(
                children: [
                  Text(state.questionnaire.questions[0].question),
                  for (var alternative in state.questionnaire.questions[state.currentQuestionIndex].alternatives)
                    Text(alternative),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to handle the answer
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            );
          } else if(state.status == QuizStatus.failure){
            return Text('Failed to load questions');
          } else {
            return Text('Unknown error');
        }}
    );
  }
}
