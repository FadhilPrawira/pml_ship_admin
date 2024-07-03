import 'dart:convert';

class ApproveUserOrOrderOrConferenceRequestModel {
  final DateTime approvedAt;

  ApproveUserOrOrderOrConferenceRequestModel({
    required this.approvedAt,
  });

  ApproveUserOrOrderOrConferenceRequestModel copyWith({
    DateTime? approvedAt,
  }) =>
      ApproveUserOrOrderOrConferenceRequestModel(
        approvedAt: approvedAt ?? this.approvedAt,
      );

  factory ApproveUserOrOrderOrConferenceRequestModel.fromJson(String str) =>
      ApproveUserOrOrderOrConferenceRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApproveUserOrOrderOrConferenceRequestModel.fromMap(
          Map<String, dynamic> json) =>
      ApproveUserOrOrderOrConferenceRequestModel(
        approvedAt: DateTime.parse(json["approved_at"]),
      );

  Map<String, dynamic> toMap() => {
        "approved_at": approvedAt.toIso8601String(),
      };
}
