import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Fromatter for displaying text as formatted by user
class FormattedText extends StatelessWidget {
  final String caption;
  final TextStyle style;

  const FormattedText({required this.caption, required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _buildTextSpans(caption),
    );
  }

  TextSpan _buildTextSpans(String text) {
    final RegExp hashtagRegExp = RegExp(r"\B#\w+");
    List<TextSpan> spans = [];

    text.splitMapJoin(
      hashtagRegExp,
      onMatch: (match) {
        spans.add(
          TextSpan(
            children: [
              WidgetSpan(
                child: Text(
                  match.group(0) ?? '', // gets the hastags to mke them bold
                  style: style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
        return match.group(0)!;
      },
      onNonMatch: (nonMatch) {
        spans.add(
          TextSpan(
            children: [
              WidgetSpan(
                child: Text(
                  nonMatch,
                  style: style,
                ),
              ),
            ],
          ),
        ); // normal text
        return nonMatch;
      },
    );

    return TextSpan(style: style, children: spans);
  }
}
