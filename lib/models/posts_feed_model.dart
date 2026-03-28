class PostsFeedModel {

  final List<PostFeed> postsFeed;

  PostsFeedModel({required this.postsFeed});

  factory PostsFeedModel.FromJson(Map<String, dynamic> json){
    List<PostFeed> posts = json["results"].map<PostFeed>(
      (post){
        return PostFeed(
          id: post["id"],
          content: post["content"],
          createdAt: post["createdAt"],
          userName: post["userName"]
        );
      }
    ).toList();
    return PostsFeedModel(postsFeed: posts);
  }
}

class PostFeed {
  final int? id;
  final String? content;
  final String? createdAt;
  final String? userName;

  PostFeed({required this.id, required this.content, required this.createdAt, required this.userName});

}