import 'package:brandie_assignment/src/features/post/presentation/scrollable_post.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/quick_share_widget.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/reel_count_widget.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/reel_indicator_widget.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/avatar_section_widget.dart';
import 'package:brandie_assignment/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

// First tab in home page
class SmartPostTab extends StatelessWidget {
  const SmartPostTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Builder for Scrollable Content of the post
        ScrollablePostBuilder(),

        // Positioned avatar section
        Positioned(
          top: 20,
          left: 16,
          child: AvatarSection(),
        ),
        Positioned(
          right: 12,
          top: 20,
          child: PostCount(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: PostCountIndicator(),
        ),
      ],
    );
  }
}
