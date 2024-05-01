import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/presentation/constants.dart';
import 'package:quizapp/presentation/quiz/bloc/quiz_bloc.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
      if (state.status == QuizStatus.success) {
        return InkWell(
          onTap: () {
            context.read<QuizBloc>().add(SelectAnswerEvent(answer: index));
          },
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                  color: context.read<QuizBloc>().getTheRightColor(index)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. ${state.questionnaire.questions[state.currentQuestionIndex].alternatives[index]}",
                  style: TextStyle(color: context.read<QuizBloc>().getTheRightColor(index), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: context.read<QuizBloc>().getTheRightColor(index) == kGrayColor
                        ? Colors.transparent
                        : context.read<QuizBloc>().getTheRightColor(index),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: context.read<QuizBloc>().getTheRightColor(index)),
                  ),
                  child: context.read<QuizBloc>().getTheRightColor(index) == kGrayColor
                      ? null
                      : Icon(Icons.traffic_sharp, color: context.read<QuizBloc>().getTheRightColor(index), size: 16),
                )
              ],
            ),
          ),
        );
      }else{
        return const SizedBox();
      }
    });
  }
}
