import 'package:brandie_assignment/src/features/post/domain/post_model.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/caption_widget.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/quick_share_widget.dart';
import 'package:brandie_assignment/src/features/post/presentation/widgets/recommended_music_widget.dart';
import 'package:brandie_assignment/src/features/post/providers/current_post_provider.dart';
import 'package:brandie_assignment/src/features/post/providers/post_count_provider.dart';
import 'package:brandie_assignment/src/features/post/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Builder for Scrollable Content of the post view
class ScrollablePostBuilder extends ConsumerStatefulWidget {
  const ScrollablePostBuilder({
    super.key,
  });

  @override
  ConsumerState<ScrollablePostBuilder> createState() =>
      _ScrollablePostBuilderState();
}

class _ScrollablePostBuilderState extends ConsumerState<ScrollablePostBuilder> {
  late PageController _pageController;

  void _onPageChanged(int currentIndex) {
    ref.read(postCountNotifierProvider.notifier).setCount(currentIndex + 1);
  }

  @override
  void initState() {
    final initialPage = ref.read(postCountNotifierProvider);
    _pageController = PageController(initialPage: initialPage - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postNotifierPorvider);

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return PostWidget(post: posts[index]);
      },
    );
  }
}

// The main post view (content, caption, avatar, count, links, etc.)
class PostWidget extends StatelessWidget {
  const PostWidget({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Post (Photo/Video)
        PostContent(postUrl: post.url),

        // Post Data
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recommended Music
              PostRecommendedMusic(recommendedMusic: post.musicInfo),
              // Caption
              PostCaption(post: post),
              // Quick share to
              QucikShareWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

// The main content (Photo/Video) of the post
class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.postUrl,
  });

  final String postUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Image.asset(
          postUrl,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
