import 'package:brandie_assignment/src/features/post/providers/post_count_provider.dart';
import 'package:brandie_assignment/src/features/post/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The indicator (in dots) on center right of post
class PostCountIndicator extends ConsumerWidget {
  const PostCountIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPosts = ref.read(postNotifierPorvider.notifier).totalPosts;
    final currentPostIndex = ref.watch(postCountNotifierProvider) - 1;

    List<Widget> _getIndicators() {
      List<Widget> indicators = [];
      for (int i = 0; i < totalPosts; i++) {
        indicators.add(Icon(
          Icons.circle,
          size: 14,
          color: currentPostIndex == i
              ? Color.fromRGBO(115, 191, 152, 0.9)
              : Colors.white,
        ));
      }

      return indicators;
    }

    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 60),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromRGBO(70, 70, 70, 0.56),
          borderRadius: BorderRadius.circular(60)),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: _getIndicators()),
    );
  }
}
