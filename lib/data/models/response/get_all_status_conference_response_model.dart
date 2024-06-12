import 'dart:convert';

class GetAllStatusConferenceResponseModel {
  final List<Datum> data;

  GetAllStatusConferenceResponseModel({
    required this.data,
  });

  factory GetAllStatusConferenceResponseModel.fromJson(String str) =>
      GetAllStatusConferenceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllStatusConferenceResponseModel.fromMap(
          Map<String, dynamic> json) =>
      GetAllStatusConferenceResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final int id;
  final String transactionId;
  final int customerCompanyId;
  final String status;
  final String conferenceType;
  final String location;
  final DateTime conferenceDate;
  final String conferenceTime;
  final dynamic conferenceApprovedAt;
  final dynamic conferenceRejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String companyName;

  Datum({
    required this.id,
    required this.transactionId,
    required this.customerCompanyId,
    required this.status,
    required this.conferenceType,
    required this.location,
    required this.conferenceDate,
    required this.conferenceTime,
    required this.conferenceApprovedAt,
    required this.conferenceRejectedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.companyName,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        transactionId: json["transaction_id"],
        customerCompanyId: json["customer_company_id"],
        status: json["status"],
        conferenceType: json["conference_type"],
        location: json["location"],
        conferenceDate: DateTime.parse(json["conference_date"]),
        conferenceTime: json["conference_time"],
        conferenceApprovedAt: json["conference_approved_at"],
        conferenceRejectedAt: json["conference_rejected_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        companyName: json["company_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "transaction_id": transactionId,
        "customer_company_id": customerCompanyId,
        "status": status,
        "conference_type": conferenceType,
        "location": location,
        "conference_date":
            "${conferenceDate.year.toString().padLeft(4, '0')}-${conferenceDate.month.toString().padLeft(2, '0')}-${conferenceDate.day.toString().padLeft(2, '0')}",
        "conference_time": conferenceTime,
        "conference_approved_at": conferenceApprovedAt,
        "conference_rejected_at": conferenceRejectedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "company_name": companyName,
      };
}
