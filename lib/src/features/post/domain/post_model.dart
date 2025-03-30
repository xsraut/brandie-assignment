// Assuming post has following parameters
class Post {
  Post(this.postId, this.url, this.caption, this.musicInfo, this.sharableLinks);

  final String postId;
  final String url;
  String caption;
  final Map<String, String> musicInfo;
  final Map<String, String> sharableLinks;
}
