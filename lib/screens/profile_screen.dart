import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var userProv = Provider.of<AuthProvider>(context);
    
    nameController.text = userProv.signInModel!.user!.username;
    emailController.text = userProv.signInModel!.user!.email;
    bioController.text = userProv.signInModel!.user!.bio;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text(
          "Profile"
        ),
        centerTitle: true,
      ),
      // body
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: [
                // Name
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      "UserName"
                    ),
                  ),
                  controller: nameController,
                ),
                SizedBox(height: 20,),
                // Email
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      "email"
                    ),
                  ),
                  controller: emailController,
                ),
                SizedBox(height: 40,),
                // Bio
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      "Bio"
                    ),
                    border: OutlineInputBorder(),
                  ),
                  controller: bioController,
                  maxLines: 5,
                ),
                SizedBox(height: 25,),
                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100)
                  ),
                  onPressed: () async{
                    await userProv.updateProfile(bioController.text);
                    if (userProv.signInModel!.status){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            userProv.signInModel!.message
                          ),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        )
                      );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            userProv.signInModel!.message
                          ),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        )
                      );
                    }
                  },
                  child: Text(
                    "Save"
                  )
                )
              ],
            )
          ),
        )
      )
    );
  }
}