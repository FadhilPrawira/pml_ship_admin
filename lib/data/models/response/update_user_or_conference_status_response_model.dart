import 'dart:convert';

class UpdateUserOrConferenceStatusResponseModel {
  final String status;
  final String message;
  final dynamic data;

  UpdateUserOrConferenceStatusResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateUserOrConferenceStatusResponseModel.fromJson(String str) =>
      UpdateUserOrConferenceStatusResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserOrConferenceStatusResponseModel.fromMap(
          Map<String, dynamic> json) =>
      UpdateUserOrConferenceStatusResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
