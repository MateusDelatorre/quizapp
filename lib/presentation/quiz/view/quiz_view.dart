import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/presentation/constants.dart';
import 'package:quizapp/presentation/hero_dialog_route.dart';
import 'package:quizapp/presentation/quiz/bloc/quiz_bloc.dart';
import 'package:quizapp/presentation/quiz/widgets/option.dart';
import 'package:quizapp/presentation/quiz/widgets/score_pop_up.dart';
import 'package:quizapp/presentation/widgets/pop_up/alert_diologs.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if(state.ended){
            if(state.gameOver){
              ScorePopUp().showPopUp(
                context: context,
                winner: state.score > 9,
                score: state.score,
                onContinuePressed: () {
                  Navigator.pop(context);
                  context.go('/');
                },
                onNoPressed: () {
                  Navigator.pop(context);
                  context.go('/');
                },
              );
            }else{
              ScorePopUp().showPopUp(
                context: context,
                winner: state.score > 9,
                score: state.score,
                onContinuePressed: () {
                  Navigator.pop(context);
                  context.go('/game/${state.nextId}');
                },
                onNoPressed: () {
                  Navigator.pop(context);
                  context.go('/');
                },
              );
            }

            // AlertDialogs().getPopUpTwoOptions(
            //   context: context,
            //   title: 'Yor Score: ${state.score}',
            //   onYesPressed: () {
            //     Navigator.pop(context);
            //     context.go('/game/1.2');
            //   },
            //   onNoPressed: () {
            //     Navigator.pop(context);
            //   },
            // );
          }
        },
        builder: (context, state) {
          if (state.status == QuizStatus.loading) {
            return const CircularProgressIndicator();
          } else if (state.status == QuizStatus.success) {
            return Stack(
              children: [
                Scaffold(
                  body: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'bg.png',
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                      SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: LinearProgressIndicator(
                                  color: Colors.amber.shade900,
                                  value: state.currentQuestionIndex /
                                      (state.questionnaire.questions.length -
                                          1),
                                  minHeight: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: kDefaultPadding),
                            const Divider(thickness: 1.5),
                            const SizedBox(height: kDefaultPadding),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              padding: const EdgeInsets.all(kDefaultPadding),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    state
                                        .questionnaire
                                        .questions[state.currentQuestionIndex]
                                        .question,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(color: kBlackColor),
                                  ),
                                  const SizedBox(height: kDefaultPadding / 2),
                                  ...List.generate(
                                    state
                                        .questionnaire
                                        .questions[state.currentQuestionIndex]
                                        .altCount,
                                    (index) => Option(
                                      index: index,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: state.isAnswered
                                          ? () {
                                              context
                                                  .read<QuizBloc>()
                                                  .add(const NextQuestionEvent());
                                            }
                                          : null,
                                      child: const Text('Next'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else if (state.status == QuizStatus.failure) {
            return Text('Failed to load questions');
          } else {
            return Text('Unknown error');
          }
        });
  }
}
