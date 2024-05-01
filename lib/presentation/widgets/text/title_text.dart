import 'package:flutter/material.dart';

/// A widget to standardize all title text
class TitleText extends StatelessWidget {
  const TitleText(
      {Key? key,
      required this.title,
      this.fontWeight,
      this.fontFamily,
      this.color,
      this.maxLines = 1,
      this.softWrap})
      : super(key: key);

  final String title;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final int maxLines;
  final Color? color;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      softWrap: softWrap,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: fontFamily ?? 'Quicksand',
          fontSize: 25),
    );
  }
}
