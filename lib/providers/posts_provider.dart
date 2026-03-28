import 'package:flutter/material.dart';
import 'package:social_media_flutter_app/models/posts_feed_model.dart';
import 'package:social_media_flutter_app/models/status_model.dart';
import 'package:social_media_flutter_app/services/posts_service.dart';

class PostsProvider extends ChangeNotifier{

  PostsFeedModel? postsFeedModel;
  StatusModel? statusModel;

  Future<void> GetPosts() async{
    postsFeedModel = await PostsService.GetPosts();
    notifyListeners();
  }

  Future<void> CreatePost(int id, String content) async{
    await PostsService.CreatePost(id, content);
    await GetPosts();
    notifyListeners();
  }

  //http://socialmediaapi.runasp.net/api/Post/773/User/36

  Future<void> deletePost({required int postId, required int userId}) async{
    statusModel = await PostsService.deletePost(postId: postId, userId: userId);
    await GetPosts();
    notifyListeners();
  }

}