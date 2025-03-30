import 'package:brandie_assignment/src/features/post/domain/post_model.dart';
import 'package:brandie_assignment/src/features/post/providers/post_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier fot current active post on screen
class CurrentPostNotifier extends Notifier<Post> {
  @override
  Post build() {
    return ref.read(postNotifierPorvider).first;
  }

  void setCurrentPost(Post currentPost) {
    state = currentPost;
  }
}

final currentPostNotifierProvider =
    NotifierProvider<CurrentPostNotifier, Post>(() => CurrentPostNotifier());
