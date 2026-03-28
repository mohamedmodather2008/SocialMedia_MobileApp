// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:social_media_flutter_app/models/posts_feed_model.dart';
import 'package:social_media_flutter_app/models/status_model.dart';

class PostsService {

  static Dio dio = Dio();

  static Future<PostsFeedModel> GetPosts() async{
    try{
      Response response = await dio.get("https://socialmediaapi.runasp.net/api/Post");
      return PostsFeedModel.FromJson(response.data);
    }
    on DioException catch(dioException){
      throw Exception(dioException.message);
    }
    catch (other){
      throw Exception(other);
    }
  }

  static Future<void> CreatePost(int id, String content) async{
    try{
      // ignore: unused_local_variable
      Response response = await dio.post("https://socialmediaapi.runasp.net/api/Post",
      data: {
        "userId" : id,
        "content" : content
      });
    }
    on DioException catch(dioException){
      throw Exception(dioException.message);
    }
    catch (other){
      throw Exception(other);
    }
  }

  static Future<StatusModel> deletePost({required int postId, required int userId}) async{
    try{
      // ignore: unused_local_variable
      Response response = await dio.delete("https://socialmediaapi.runasp.net/api/Post/$postId/User/$userId");
      return StatusModel.FromJson(response.data);
    }
    on DioException catch(dioException){
      throw Exception(dioException.message);
    }
    catch (other){
      throw Exception(other);
    }
  }

}