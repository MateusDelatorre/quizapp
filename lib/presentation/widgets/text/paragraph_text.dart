import 'package:flutter/material.dart';

/// A widget to standardize all paragraph text
class ParagraphText extends StatelessWidget {
  const ParagraphText(
      {Key? key, required this.title, this.maxLines, this.overflow, this.color})
      : super(key: key);

  final String title;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 15,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
