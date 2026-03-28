import 'package:flutter/material.dart';
import 'package:social_media_flutter_app/models/sign_up_model.dart';
import 'package:social_media_flutter_app/services/auth_service.dart';

class AuthProvider extends ChangeNotifier{
  SignModel? signUpModel;
  SignModel? signInModel;

  Future<void> SignUp({required String userName, required String email, required String password, required String confirmpassword}) async{
    signUpModel = await AuthService.SignUp(userName: userName, email: email, password: password, confirmpassword: confirmpassword);
  }

  Future<void> SignIn({required String email, required String password}) async{
    signInModel = await AuthService.SignIn(email: email, password: password);
  }

  Future<void> updateProfile(String bio) async{
    var data = await AuthService.updateProfile(id: signInModel!.user!.id, bio: bio);
    signInModel!.status = data["status"];
    signInModel!.message = data["message"];
    signInModel!.user!.bio = data["user"]["bio"];
    notifyListeners();
  }

}

