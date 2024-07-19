import 'dart:convert';

class CompleteOrderRequestModel {
  final DateTime completedAt;

  CompleteOrderRequestModel({
    required this.completedAt,
  });

  factory CompleteOrderRequestModel.fromJson(String str) =>
      CompleteOrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompleteOrderRequestModel.fromMap(Map<String, dynamic> json) =>
      CompleteOrderRequestModel(
        completedAt: DateTime.parse(json["completed_at"]),
      );

  Map<String, dynamic> toMap() => {
        "completed_at": completedAt.toIso8601String(),
      };
}
