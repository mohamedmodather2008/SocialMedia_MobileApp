class SignModel {
  bool status;
  String message;
  final User? user;

  SignModel({required this.status, required this.message, required this.user});

  factory SignModel.FromJson(Map<String, dynamic> json){
    User userFrom = User(
      username: json["user"]["userName"],
      email: json["user"]["email"],
      id: json["user"]["id"],
      bio: json["user"]["bio"]
    );
    return SignModel(status: json["status"], message : json["message"], user: userFrom);
  }
}

class User{
  final int id;
  final String username;
  final String email;
  String bio;

  User({required this.username, required this.email, required this.id, required this.bio});

}