import 'dart:convert';

class RejectUserOrOrderOrConferenceRequestModel {
  final DateTime rejectedAt;

  RejectUserOrOrderOrConferenceRequestModel({
    required this.rejectedAt,
  });

  factory RejectUserOrOrderOrConferenceRequestModel.fromJson(String str) =>
      RejectUserOrOrderOrConferenceRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RejectUserOrOrderOrConferenceRequestModel.fromMap(
          Map<String, dynamic> json) =>
      RejectUserOrOrderOrConferenceRequestModel(
        rejectedAt: DateTime.parse(json["rejected_at"]),
      );

  Map<String, dynamic> toMap() => {
        "rejected_at": rejectedAt.toIso8601String(),
      };
}
