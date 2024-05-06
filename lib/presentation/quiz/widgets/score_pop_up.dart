import 'package:flutter/material.dart';
import 'package:quizapp/presentation/hero_dialog_route.dart';
import 'package:quizapp/presentation/widgets/text/paragraph_text.dart';
import 'package:quizapp/presentation/widgets/text/title_text.dart';

class ScorePopUp{

  getPopUpTwoOptions({
        required BuildContext context,
        required bool winner,
        required int score,
        required void Function() onContinuePressed,
        required void Function() onNoPressed}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              winner ? const TitleText(title: "You Win!") : const TitleText(title: "You Lose!"),
              const SizedBox(height: 10),
              TitleText(title: "Your Score: $score"),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton(
                    onPressed: onContinuePressed,
                    child: const ParagraphText(
                        title: "Continue"
                    ),
                  ),
                  TextButton(
                    onPressed: onNoPressed,
                    child: const ParagraphText(
                        title: "Go Home"
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  showPopUp({
    required BuildContext context,
    required bool winner,
    required int score,
    required void Function() onContinuePressed,
    required void Function() onNoPressed}) {

    Navigator.of(context).push(HeroDialogRoute(
      builder: (context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Material(
              elevation: 2,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      winner ? const TitleText(title: "You Win!") : const TitleText(title: "You Lose!"),
                      const SizedBox(height: 10),
                      TitleText(title: "Your Score: $score"),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: onContinuePressed,
                            child: const ParagraphText(
                                title: "Continue"
                            ),
                          ),
                          TextButton(
                            onPressed: onNoPressed,
                            child: const ParagraphText(
                                title: "Go Home"
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },));

    // return showDialog<void>(
    //   context: context,
    //   barrierDismissible: false, // user must tap button!
    //   builder: (BuildContext context) {
    //
    //   },
    // );
  }
}