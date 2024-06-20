import 'dart:convert';

class GetAllStatusOrderResponseModel {
  final List<Order> data;

  GetAllStatusOrderResponseModel({
    required this.data,
  });

  factory GetAllStatusOrderResponseModel.fromJson(String str) =>
      GetAllStatusOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllStatusOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllStatusOrderResponseModel(
        data: List<Order>.from(json["data"].map((x) => Order.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Order {
  final int id;
  final String transactionId;
  final int userId;
  final String shipperName;
  final String shipperAddress;
  final String consigneeName;
  final String consigneeAddress;
  final int portOfLoadingId;
  final int portOfDischargeId;
  final int vesselId;
  final DateTime dateOfLoading;
  final DateTime dateOfDischarge;
  final String status;
  final String cargoDescription;
  final String cargoWeight;
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;
  final int? tax;
  final int? totalCost;
  final String? shippingInstructionDocumentUrl;
  final String? billOfLadingDocumentUrl;
  final String? cargoManifestDocumentUrl;
  final String? timeSheetDocumentUrl;
  final String? draughtSurveyDocumentUrl;
  final int? ratingStar;
  final String? review;
  final DateTime? negotiationApprovedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String portOfLoadingName;
  final String portOfDischargeName;

  Order({
    required this.id,
    required this.transactionId,
    required this.userId,
    required this.shipperName,
    required this.shipperAddress,
    required this.consigneeName,
    required this.consigneeAddress,
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.vesselId,
    required this.dateOfLoading,
    required this.dateOfDischarge,
    required this.status,
    required this.cargoDescription,
    required this.cargoWeight,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
    this.tax,
    this.totalCost,
    this.shippingInstructionDocumentUrl,
    this.billOfLadingDocumentUrl,
    this.cargoManifestDocumentUrl,
    this.timeSheetDocumentUrl,
    this.draughtSurveyDocumentUrl,
    this.ratingStar,
    this.review,
    this.negotiationApprovedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.portOfLoadingName,
    required this.portOfDischargeName,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
        portOfLoadingId: json["port_of_loading_id"],
        portOfDischargeId: json["port_of_discharge_id"],
        vesselId: json["vessel_id"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        dateOfDischarge: DateTime.parse(json["date_of_discharge"]),
        status: json["status"],
        cargoDescription: json["cargo_description"],
        cargoWeight: json["cargo_weight"],
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
        tax: json["tax"],
        totalCost: json["total_cost"],
        shippingInstructionDocumentUrl:
            json["shipping_instruction_document_url"],
        billOfLadingDocumentUrl: json["bill_of_lading_document_url"],
        cargoManifestDocumentUrl: json["cargo_manifest_document_url"],
        timeSheetDocumentUrl: json["time_sheet_document_url"],
        draughtSurveyDocumentUrl: json["draught_survey_document_url"],
        ratingStar: json["rating_star"],
        review: json["review"],
        negotiationApprovedAt: json["negotiation_approved_at"] != null
            ? DateTime.parse(json["negotiation_approved_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        portOfLoadingName: json["port_of_loading_name"],
        portOfDischargeName: json["port_of_discharge_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "transaction_id": transactionId,
        "user_id": userId,
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
        "port_of_loading_id": portOfLoadingId,
        "port_of_discharge_id": portOfDischargeId,
        "vessel_id": vesselId,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "date_of_discharge":
            "${dateOfDischarge.year.toString().padLeft(4, '0')}-${dateOfDischarge.month.toString().padLeft(2, '0')}-${dateOfDischarge.day.toString().padLeft(2, '0')}",
        "status": status,
        "cargo_description": cargoDescription,
        "cargo_weight": cargoWeight,
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
        "tax": tax,
        "total_cost": totalCost,
        "shipping_instruction_document_url": shippingInstructionDocumentUrl,
        "bill_of_lading_document_url": billOfLadingDocumentUrl,
        "cargo_manifest_document_url": cargoManifestDocumentUrl,
        "time_sheet_document_url": timeSheetDocumentUrl,
        "draught_survey_document_url": draughtSurveyDocumentUrl,
        "rating_star": ratingStar,
        "review": review,
        "negotiation_approved_at": negotiationApprovedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "port_of_loading_name": portOfLoadingName,
        "port_of_discharge_name": portOfDischargeName,
      };
}
