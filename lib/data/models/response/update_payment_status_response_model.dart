import 'dart:convert';

class UpdatePaymentStatusResponseModel {
  final String status;
  final String message;
  final dynamic data;

  UpdatePaymentStatusResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdatePaymentStatusResponseModel.fromJson(String str) =>
      UpdatePaymentStatusResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePaymentStatusResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdatePaymentStatusResponseModel(
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
