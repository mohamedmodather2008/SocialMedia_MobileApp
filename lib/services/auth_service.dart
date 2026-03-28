import 'package:dio/dio.dart';
import 'package:social_media_flutter_app/models/sign_up_model.dart';

class AuthService {

  static Dio dio = Dio();

  static Future<SignModel> SignUp({required String userName, required String email, required String password, required String confirmpassword}) async{
    try{
      Response response = await dio.post("https://socialmediaapi.runasp.net/api/Account/Signup",
      data: {
        "userName" : userName,
        "email" : email,
        "password" : password,
        "confirmPassword" : confirmpassword
      });
      return SignModel.FromJson(response.data);
    }
    on DioException catch(dioException){
      throw Exception(dioException.message);
    }
    catch (other){
      throw Exception(other);
    }
  }

  static Future<SignModel> SignIn({required String email, required String password}) async{
    try{
      Response response = await dio.post("https://socialmediaapi.runasp.net/api/Account/Login",
      data: {
        "email" : email,
        "password" : password,
      });
      return SignModel.FromJson(response.data);
    }
    on DioException catch(dioException){
      throw Exception(dioException.message);
    }
    catch (other){
      throw Exception(other);
    }
  }

  static Future<Map<String, dynamic>> updateProfile({required int id, required String bio}) async{
    try{
      Response response = await dio.post("https://socialmediaapi.runasp.net/api/User/$id",
      data: {
        "bio" : bio,
      });
      return response.data;
    }
    on DioException catch(dioException){
      throw Exception(dioException.message);
    }
    catch (other){
      throw Exception(other);
    }
  }
  

}