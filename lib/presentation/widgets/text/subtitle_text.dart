import 'package:flutter/material.dart';

/// A widget to standardize all subtitle text
class SubtitleText extends StatelessWidget {
  const SubtitleText(
      {Key? key,
      required this.title,
      this.maxLines = 1,
      this.color,
      this.softWrap})
      : super(key: key);

  final String title;
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
        fontWeight: FontWeight.bold,
        fontFamily: 'Quicksand',
        fontSize: 15,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
