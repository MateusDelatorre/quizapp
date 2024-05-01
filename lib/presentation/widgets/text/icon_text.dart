import 'package:flutter/material.dart';

/// A widget to standardize all subtitle text
class IconText extends StatelessWidget {
  const IconText({Key? key, required this.title, required this.icon})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 5,
          child: Container(),
        ),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
              fontSize: 20),
        )
      ],
    );
  }
}
