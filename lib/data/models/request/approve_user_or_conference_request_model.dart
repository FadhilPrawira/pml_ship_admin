import 'dart:convert';

class ApproveUserOrConferenceRequestModel {
  final DateTime approvedDate;

  ApproveUserOrConferenceRequestModel({
    required this.approvedDate,
  });

  factory ApproveUserOrConferenceRequestModel.fromJson(String str) =>
      ApproveUserOrConferenceRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApproveUserOrConferenceRequestModel.fromMap(
          Map<String, dynamic> json) =>
      ApproveUserOrConferenceRequestModel(
        approvedDate: DateTime.parse(json["approvedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "approvedDate": approvedDate.toIso8601String(),
      };
}
