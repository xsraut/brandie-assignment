import 'package:brandie_assignment/src/features/post/providers/post_count_provider.dart';
import 'package:brandie_assignment/src/features/post/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// The post counter at the top right of the post
class PostCount extends ConsumerWidget {
  const PostCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPost = ref.watch(postCountNotifierProvider);
    final totalPosts = ref.read(postNotifierPorvider.notifier).totalPosts;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromRGBO(49, 49, 49, 0.39),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        '$currentPost of $totalPosts',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
