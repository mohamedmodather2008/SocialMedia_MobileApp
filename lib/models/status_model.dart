class StatusModel {
  final bool status;
  final String message;

  StatusModel({required this.status, required this.message});

  factory StatusModel.FromJson(Map<String, dynamic> json){
    return StatusModel(status: json["status"], message: json["message"]);
  }

}