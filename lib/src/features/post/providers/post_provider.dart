import 'package:brandie_assignment/src/features/post/domain/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends Notifier<List<Post>> {
  // TODO: add functions to fetch post data from API

  @override
  List<Post> build() {
    return [
      // Hardcoded Data :
      Post(
          'post id 1',
          'assets/images/IMG_Lipstick.png',
          "💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy lipstick doesn't just promise rich pigments but brings you the benefits of hyaluronic acid and collagen-boosting peptides too. Pamper your lips with care while enjoying a long-lasting, luminous matte colour. 💋 ✨ #Oriflame #GiordaniGold #LipCareGoals Use my referral code: UK-AMANDA3012 Use my referral link: www.oriflame.com/giordani/amada3012",
          {'music': 'Bad Habits', 'artist': 'Ed Sheeran'},
          {'instagram': 'https://instagram.com/sharableLink1'}),
      Post(
          'post id 2',
          'assets/images/IMG_perfume.png',
          "✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance Use my referral code: UK-AMANDA3012 Use my referral link: www.oriflame.com/giordani/amada3012",
          {'music': 'Unstoppable', 'artist': 'Sia'},
          {'instagram': 'https://instagram.com/sharableLink2'}),
      Post(
          'post id 3',
          'assets/images/IMG_cake.png',
          "Unlock the power of bold, beautiful lashes! With WonderLash Mascara, get ultimate length, volume, and definition for a stunning, eye-catching look. One swipe is all it takes! 💖 #WonderLash #LashesForDays Use my referral code: UK-AMANDA3012 Use my referral link: www.oriflame.com/giordani/amada3012",
          {'music': 'Vogue', 'artist': 'Madonna'},
          {'instagram': 'https://instagram.com/sharableLink'}),
    ];
  }

  // functions

  get totalPosts => state.length;

  void updatePost(String postId, String newCaption) {
    state.where((post) => post.postId == postId).first.caption = newCaption;
  }
}

final postNotifierPorvider =
    NotifierProvider<PostNotifier, List<Post>>(() => PostNotifier());
