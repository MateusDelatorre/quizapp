import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/presentation/quiz/bloc/quiz_bloc.dart';
import 'package:quizapp/presentation/quiz/view/quiz_view.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(id: id)..add(GetQuizEvent(id: id)),
      child: const QuizView(),
    );
  }
}
