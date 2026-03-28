// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/models/posts_feed_model.dart';
import 'package:social_media_flutter_app/providers/posts_provider.dart';
import 'package:social_media_flutter_app/screens/create_post_screen.dart';
import 'package:social_media_flutter_app/services/posts_service.dart';
import 'package:social_media_flutter_app/widgets/custom_post_list_tile.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var postProv = Provider.of<PostsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(
          "Posts Feed"
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              await postProv.GetPosts();
            },
            icon: Icon(Icons.circle)
          )
        ],
      ),
      // Body
      body: SafeArea(
        child: Consumer<PostsProvider>(
          builder: (context, postprovider, child) {
            var posts = postprovider.postsFeedModel?.postsFeed;
            if (posts == null){
              postprovider.GetPosts();
              return Center(child: CircularProgressIndicator(),);
            }
            else{
              return ListView.builder(
                itemCount: posts.length,
                reverse: true,
                itemBuilder: (context, index){
                  return CustomPostListTile(post: posts[index]);
                }
              );
            }
          },
        )
      ),
      // Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (con) => CreatePostScreen())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}