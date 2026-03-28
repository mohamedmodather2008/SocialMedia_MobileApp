// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/providers/auth_provider.dart';
import 'package:social_media_flutter_app/providers/posts_provider.dart';
import 'package:social_media_flutter_app/screens/posts_screen.dart';
import 'package:social_media_flutter_app/screens/profile_screen.dart';

// ignore: use_key_in_widget_constructors
class CreatePostScreen extends StatelessWidget {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final postContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context, listen: false);
    var postProv = Provider.of<PostsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Post"
        ),
        actions: [
          // TextButton(
          //   onPressed: () async{
          //     if (_formKey.currentState!.validate()){
          //       int id = auth.signInModel!.user!.id;
          //       await postProv.CreatePost(id, postContentController.text);
          //       Navigator.pop(context);
          //     }
          //   },
          //   child: Text(
          //     "Post"
          //   )
          // ),
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (con) => ProfileScreen())
              );
            },
            icon: Icon(Icons.person)
          )
        ],
      ),
      // body
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Write Your Post"
                      ),
                      border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value == null || value == ""){
                        return "Can't create an empty message idiot";
                      }
                      return null;
                    },
                    controller: postContentController,
                  )
                ),
              ),
              // button
              TextButton(
                onPressed: () async{
                  if (_formKey.currentState!.validate()){
                    int id = auth.signInModel!.user!.id;
                    await postProv.CreatePost(id, postContentController.text);
                    Navigator.pop(context);
                  }
                  },
                  child: Text(
                    "Post"
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}