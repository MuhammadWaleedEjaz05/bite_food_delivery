import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    required this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: style,
    maxLines: maxLines,
    overflow: overflow ?? (maxLines == null ? null : TextOverflow.ellipsis),
    textAlign: textAlign,
  );
}
