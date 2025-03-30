import 'package:brandie_assignment/src/features/post/domain/post_model.dart';
import 'package:brandie_assignment/src/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Post's caption display
class PostCaption extends StatelessWidget {
  const PostCaption({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // push to edit page
        GoRouter.of(context).push('/editCaption', extra: post);
      },
      child: Container(
          width: MediaQuery.of(context).size.width - 32,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(49, 49, 49, 0.39),
              borderRadius: BorderRadius.circular(8)),
          child: FormattedText(
            caption: post.caption,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
            ),
          )),
    );
  }
}
