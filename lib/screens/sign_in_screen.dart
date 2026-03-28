// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/providers/auth_provider.dart';
import 'package:social_media_flutter_app/screens/posts_screen.dart';
import 'package:social_media_flutter_app/screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Sign In Screen"),
        centerTitle: true,
      ),
      // body
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(Icons.account_circle, color: Colors.white, size: 150),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Email"),
                        border: OutlineInputBorder(),
                      ),
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    // Password
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Password"),
                        border: OutlineInputBorder(),
                      ),
                      controller: passController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Elevated Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authProvider.SignIn(
                      email: emailController.text,
                      password: passController.text,
                    );
                    if (authProvider.signInModel!.status == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(authProvider.signInModel!.message),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostsScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(authProvider.signInModel!.message),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text("Dont have an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
