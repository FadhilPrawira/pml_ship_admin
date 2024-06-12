import 'dart:convert';

class RejectUserOrConferenceRequestModel {
  final DateTime rejectedDate;

  RejectUserOrConferenceRequestModel({
    required this.rejectedDate,
  });

  factory RejectUserOrConferenceRequestModel.fromJson(String str) =>
      RejectUserOrConferenceRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RejectUserOrConferenceRequestModel.fromMap(
          Map<String, dynamic> json) =>
      RejectUserOrConferenceRequestModel(
        rejectedDate: DateTime.parse(json["rejectedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "rejectedDate": rejectedDate.toIso8601String(),
      };
}
