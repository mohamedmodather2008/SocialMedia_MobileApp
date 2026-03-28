import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/models/posts_feed_model.dart';
import 'package:social_media_flutter_app/providers/auth_provider.dart';
import 'package:social_media_flutter_app/providers/posts_provider.dart';

class CustomPostListTile extends StatelessWidget {

  final PostFeed post;

  const CustomPostListTile({required this.post});

  @override
  Widget build(BuildContext context) {
    var authProv = Provider.of<AuthProvider>(context, listen: false);
    var postProv = Provider.of<PostsProvider>(context);
    return Card(
      child: ListTile(
        title: Text(
          "${post.content}",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          "By : ${post.userName}"
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${post.createdAt}"
            ),
            SizedBox(width: 5,),
            post.userName == authProv.signInModel!.user!.username ?
            IconButton(
              onPressed: () async{
                await postProv.deletePost(postId: post.id!, userId: authProv.signInModel!.user!.id);
                if (postProv.statusModel!.status == true){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        postProv.statusModel!.message
                      ),
                      backgroundColor: Colors.green,
                    )
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        postProv.statusModel!.message
                      ),
                      backgroundColor: Colors.red,
                    )
                  );
                }
              },
              icon: Icon(Icons.delete,color: Colors.red,)
            )
            : SizedBox()
            
          ],
        ),
      ),
    );
  } 
}