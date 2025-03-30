import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier fot keeping count of the scrolled posts
class PostCountProvider extends Notifier<int> {
  @override
  build() {
    return 1;
  }

  void setCount(int count) {
    state = count;
  }
}

final postCountNotifierProvider =
    NotifierProvider<PostCountProvider, int>(() => PostCountProvider());
