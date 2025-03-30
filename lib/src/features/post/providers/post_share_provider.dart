import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier to generate sharable links (assuming it takes PostId and platform name as parameters)
class SharePostServiceNotifier extends Notifier<String> {
  SharePostServiceNotifier(this.postId, this.url);
  final url;
  final postId;

  @override
  String build() {
    return url;
  }

  // edit this method to generate link based on postId and platform for which the link is to be generated
  void generateLink(String postId, String platformName) {
    state = "https://$platformName.com/$postId";
  }
}

final sharePostServiceNotifierProvider =
    NotifierProvider<SharePostServiceNotifier, String>(
        () => SharePostServiceNotifier(String, String));
