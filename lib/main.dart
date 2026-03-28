import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_flutter_app/providers/auth_provider.dart';
import 'package:social_media_flutter_app/providers/posts_provider.dart';
import 'package:social_media_flutter_app/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (con) => AuthProvider()),
        ChangeNotifierProvider(create: (con) => PostsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUpScreen(),
      ),
    );
  }
}
