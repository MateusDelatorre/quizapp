import 'package:flutter/material.dart';
import 'package:quizapp/presentation/widgets/text/paragraph_text.dart';
import 'package:quizapp/presentation/widgets/text/title_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlertDialogs {
  getPopUpYesNo(
      {required BuildContext context,
        required String title,
        required void Function() onYesPressed,
        required void Function() onNoPressed}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: TitleText(title: title),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  onPressed: onYesPressed,
                  child:
                  ParagraphText(title: AppLocalizations.of(context)!.yes),
                ),
                TextButton(
                  onPressed: onNoPressed,
                  child: ParagraphText(title: AppLocalizations.of(context)!.no),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> getMyInputDialog({
    required BuildContext context,
    required String title,
    InputDecoration? decoration = const InputDecoration(),
    void Function(String)? onFieldSubmitted,
    required void Function(String) onAcceptButtonPressed,
    required String acceptButtonTitle,
    required void Function() onCancelButtonPressed,
    required String cancelButtonTitle,
  }) async {
    TextEditingController codeController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: TitleText(
            title: title,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          actions: <Widget>[
            TextFormField(
              controller: codeController,
              decoration: decoration,
              onFieldSubmitted: onFieldSubmitted,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    onAcceptButtonPressed(codeController.text);
                  },
                  child: ParagraphText(
                    title: acceptButtonTitle,
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xff570389)
                        : Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: onCancelButtonPressed,
                  child: ParagraphText(
                    title: cancelButtonTitle,
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xff570389)
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  getInfoPopUp(
      {required BuildContext context,
        required String title,
        required String message,
        required void Function() onOkPressed}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: TitleText(title: title),
          actions: <Widget>[
            Column(
              children: [
                Text(
                  message,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: onOkPressed,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 124, 124, 124))),
                  child: ParagraphText(
                      title: AppLocalizations.of(context)!.ok,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
