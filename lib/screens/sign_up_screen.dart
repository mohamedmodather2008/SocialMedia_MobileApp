import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/providers/auth_provider.dart';
import 'package:social_media_flutter_app/screens/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Sign Up Screen"),
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
                    // User Name
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("User Name"),
                        border: OutlineInputBorder(),
                      ),
                      controller: userNameController,
                    ),
                    // Email
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Email"),
                        border: OutlineInputBorder(),
                      ),
                      controller: emailController,
                    ),
                    // Password
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Password"),
                        border: OutlineInputBorder(),
                      ),
                      controller: passController,
                    ),
                    // Confirm Passowrd
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Confirm Password"),
                        border: OutlineInputBorder(),
                      ),
                      controller: confirmPasswordController,
                    ),
                  ],
                ),
              ),
              // Elevated Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authProvider.SignUp(
                      userName: userNameController.text,
                      email: emailController.text,
                      password: passController.text,
                      confirmpassword: confirmPasswordController.text,
                    );
                    if (authProvider.signUpModel!.status == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(authProvider.signUpModel!.message),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(authProvider.signUpModel!.message),
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
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text("Already have an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
