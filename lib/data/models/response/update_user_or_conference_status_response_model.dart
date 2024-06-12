import 'dart:convert';

class UpdateUserOrConferenceStatusResponseModel {
  final String message;

  UpdateUserOrConferenceStatusResponseModel({
    required this.message,
  });

  factory UpdateUserOrConferenceStatusResponseModel.fromJson(String str) =>
      UpdateUserOrConferenceStatusResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserOrConferenceStatusResponseModel.fromMap(
          Map<String, dynamic> json) =>
      UpdateUserOrConferenceStatusResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
