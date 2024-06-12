import 'dart:convert';

class ConferenceResponseModel {
  final FullConferenceData data;

  ConferenceResponseModel({
    required this.data,
  });

  factory ConferenceResponseModel.fromJson(String str) =>
      ConferenceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConferenceResponseModel.fromMap(Map<String, dynamic> json) =>
      ConferenceResponseModel(
        data: FullConferenceData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class FullConferenceData {
  final int id;
  final String transactionId;
  final int customerCompanyId;
  final String status;
  final String conferenceType;
  final String location;
  final DateTime conferenceDate;
  final String conferenceTime;
  final DateTime? conferenceApprovedAt;
  final DateTime? conferenceRejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String companyName;
  final String portOfLoadingName;
  final String portOfDischargeName;
  final DateTime dateOfLoading;
  final DateTime dateOfDischarge;
  final String shipperName;
  final String consigneeName;

  FullConferenceData({
    required this.id,
    required this.transactionId,
    required this.customerCompanyId,
    required this.status,
    required this.conferenceType,
    required this.location,
    required this.conferenceDate,
    required this.conferenceTime,
    this.conferenceApprovedAt,
    this.conferenceRejectedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.companyName,
    required this.portOfLoadingName,
    required this.portOfDischargeName,
    required this.dateOfLoading,
    required this.dateOfDischarge,
    required this.shipperName,
    required this.consigneeName,
  });

  factory FullConferenceData.fromJson(String str) =>
      FullConferenceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FullConferenceData.fromMap(Map<String, dynamic> json) =>
      FullConferenceData(
        id: json["id"],
        transactionId: json["transaction_id"],
        customerCompanyId: json["customer_company_id"],
        status: json["status"],
        conferenceType: json["conference_type"],
        location: json["location"],
        conferenceDate: DateTime.parse(json["conference_date"]),
        conferenceTime: json["conference_time"],
        conferenceApprovedAt: json["conference_approved_at"] != null
            ? DateTime.parse(json["conference_approved_at"])
            : null,
        conferenceRejectedAt: json["conference_rejected_at"] != null
            ? DateTime.parse(json["conference_rejected_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        companyName: json["company_name"],
        portOfLoadingName: json["port_of_loading_name"],
        portOfDischargeName: json["port_of_discharge_name"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        dateOfDischarge: DateTime.parse(json["date_of_discharge"]),
        shipperName: json["shipper_name"],
        consigneeName: json["consignee_name"],
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
        "conference_approved_at": conferenceApprovedAt?.toIso8601String(),
        "conference_rejected_at": conferenceRejectedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "company_name": companyName,
        "port_of_loading_name": portOfLoadingName,
        "port_of_discharge_name": portOfDischargeName,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "date_of_discharge":
            "${dateOfDischarge.year.toString().padLeft(4, '0')}-${dateOfDischarge.month.toString().padLeft(2, '0')}-${dateOfDischarge.day.toString().padLeft(2, '0')}",
        "shipper_name": shipperName,
        "consignee_name": consigneeName,
      };
}
