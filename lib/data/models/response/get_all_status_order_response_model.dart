import 'dart:convert';

class GetAllStatusOrderResponseModel {
  final String status;
  final String message;
  final List<Datum> data;

  GetAllStatusOrderResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllStatusOrderResponseModel.fromJson(String str) =>
      GetAllStatusOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllStatusOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllStatusOrderResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final String status;
  final String transactionId;
  final String customerCompanyName;
  final Vessel vessel;
  final Discharge loading;
  final Discharge discharge;
  final Cargo cargo;
  final Consignee shipper;
  final Consignee consignee;
  final List<Document> documents;
  final DatumPayment payment;
  final Rating rating;
  final DateTime negotiationOrOrderApprovedAt;
  final dynamic orderRejectedAt;
  final dynamic orderCanceledAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.status,
    required this.transactionId,
    required this.customerCompanyName,
    required this.vessel,
    required this.loading,
    required this.discharge,
    required this.cargo,
    required this.shipper,
    required this.consignee,
    required this.documents,
    required this.payment,
    required this.rating,
    required this.negotiationOrOrderApprovedAt,
    required this.orderRejectedAt,
    required this.orderCanceledAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        status: json["status"],
        transactionId: json["transaction_id"],
        customerCompanyName: json["customer_company_name"],
        vessel: Vessel.fromMap(json["vessel"]),
        loading: Discharge.fromMap(json["loading"]),
        discharge: Discharge.fromMap(json["discharge"]),
        cargo: Cargo.fromMap(json["cargo"]),
        shipper: Consignee.fromMap(json["shipper"]),
        consignee: Consignee.fromMap(json["consignee"]),
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromMap(x))),
        payment: DatumPayment.fromMap(json["payment"]),
        rating: Rating.fromMap(json["rating"]),
        negotiationOrOrderApprovedAt:
            DateTime.parse(json["negotiation_or_order_approved_at"]),
        orderRejectedAt: json["order_rejected_at"],
        orderCanceledAt: json["order_canceled_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "transaction_id": transactionId,
        "customer_company_name": customerCompanyName,
        "vessel": vessel.toMap(),
        "loading": loading.toMap(),
        "discharge": discharge.toMap(),
        "cargo": cargo.toMap(),
        "shipper": shipper.toMap(),
        "consignee": consignee.toMap(),
        "documents": List<dynamic>.from(documents.map((x) => x.toMap())),
        "payment": payment.toMap(),
        "rating": rating.toMap(),
        "negotiation_or_order_approved_at":
            negotiationOrOrderApprovedAt.toIso8601String(),
        "order_rejected_at": orderRejectedAt,
        "order_canceled_at": orderCanceledAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Cargo {
  final String description;
  final String weight;

  Cargo({
    required this.description,
    required this.weight,
  });

  factory Cargo.fromJson(String str) => Cargo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cargo.fromMap(Map<String, dynamic> json) => Cargo(
        description: json["description"],
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "weight": weight,
      };
}

class Consignee {
  final String name;
  final String address;

  Consignee({
    required this.name,
    required this.address,
  });

  factory Consignee.fromJson(String str) => Consignee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Consignee.fromMap(Map<String, dynamic> json) => Consignee(
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "address": address,
      };
}

class Discharge {
  final String port;
  final DateTime date;

  Discharge({
    required this.port,
    required this.date,
  });

  factory Discharge.fromJson(String str) => Discharge.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Discharge.fromMap(Map<String, dynamic> json) => Discharge(
        port: json["port"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "port": port,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class Document {
  final String? documentName;
  final String documentType;
  final DateTime? maxInputDocumentAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Document({
    required this.documentName,
    required this.documentType,
    required this.maxInputDocumentAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        documentName: json["document_name"],
        documentType: json["document_type"],
        maxInputDocumentAt: json["max_input_document_at"] == null
            ? null
            : DateTime.parse(json["max_input_document_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "document_name": documentName,
        "document_type": documentType,
        "max_input_document_at": maxInputDocumentAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class DatumPayment {
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;
  final int tax;
  final int totalBill;
  final dynamic cumulativePaid;
  final List<PaymentElement> payments;

  DatumPayment({
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
    required this.tax,
    required this.totalBill,
    required this.cumulativePaid,
    required this.payments,
  });

  factory DatumPayment.fromJson(String str) =>
      DatumPayment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumPayment.fromMap(Map<String, dynamic> json) => DatumPayment(
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
        tax: json["tax"],
        totalBill: json["total_bill"],
        cumulativePaid: json["cumulative_paid"],
        payments: List<PaymentElement>.from(
            json["payments"].map((x) => PaymentElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
        "tax": tax,
        "total_bill": totalBill,
        "cumulative_paid": cumulativePaid,
        "payments": List<dynamic>.from(payments.map((x) => x.toMap())),
      };
}

class PaymentElement {
  final DateTime paymentDate;
  final DateTime paymentDueDate;
  final int paymentAmount;
  final String paymentProofDocument;
  final int installmentNumber;
  final dynamic totalInstallments;
  final String paymentStatus;
  final DateTime? approvedAt;
  final dynamic rejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentElement({
    required this.paymentDate,
    required this.paymentDueDate,
    required this.paymentAmount,
    required this.paymentProofDocument,
    required this.installmentNumber,
    required this.totalInstallments,
    required this.paymentStatus,
    required this.approvedAt,
    required this.rejectedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentElement.fromJson(String str) =>
      PaymentElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentElement.fromMap(Map<String, dynamic> json) => PaymentElement(
        paymentDate: DateTime.parse(json["payment_date"]),
        paymentDueDate: DateTime.parse(json["payment_due_date"]),
        paymentAmount: json["payment_amount"],
        paymentProofDocument: json["payment_proof_document"],
        installmentNumber: json["installment_number"],
        totalInstallments: json["total_installments"],
        paymentStatus: json["payment_status"],
        approvedAt: json["approved_at"] == null
            ? null
            : DateTime.parse(json["approved_at"]),
        rejectedAt: json["rejected_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "payment_date":
            "${paymentDate.year.toString().padLeft(4, '0')}-${paymentDate.month.toString().padLeft(2, '0')}-${paymentDate.day.toString().padLeft(2, '0')}",
        "payment_due_date": paymentDueDate.toIso8601String(),
        "payment_amount": paymentAmount,
        "payment_proof_document": paymentProofDocument,
        "installment_number": installmentNumber,
        "total_installments": totalInstallments,
        "payment_status": paymentStatus,
        "approved_at": approvedAt?.toIso8601String(),
        "rejected_at": rejectedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Rating {
  final dynamic star;
  final dynamic review;

  Rating({
    required this.star,
    required this.review,
  });

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        star: json["star"],
        review: json["review"],
      );

  Map<String, dynamic> toMap() => {
        "star": star,
        "review": review,
      };
}

class Vessel {
  final String vesselName;
  final double vesselLat;
  final double vesselLon;
  final String vesselVtsSpeedKnot;
  final String vesselCalcSpeedKnot;
  final String vesselHeadingDegree;
  final DateTime pmlLastUpdatedAt;

  Vessel({
    required this.vesselName,
    required this.vesselLat,
    required this.vesselLon,
    required this.vesselVtsSpeedKnot,
    required this.vesselCalcSpeedKnot,
    required this.vesselHeadingDegree,
    required this.pmlLastUpdatedAt,
  });

  factory Vessel.fromJson(String str) => Vessel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vessel.fromMap(Map<String, dynamic> json) => Vessel(
        vesselName: json["vessel_name"],
        vesselLat: json["vessel_lat"]?.toDouble(),
        vesselLon: json["vessel_lon"]?.toDouble(),
        vesselVtsSpeedKnot: json["vessel_vts_speed_knot"],
        vesselCalcSpeedKnot: json["vessel_calc_speed_knot"],
        vesselHeadingDegree: json["vessel_heading_degree"],
        pmlLastUpdatedAt: DateTime.parse(json["pml_last_updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "vessel_name": vesselName,
        "vessel_lat": vesselLat,
        "vessel_lon": vesselLon,
        "vessel_vts_speed_knot": vesselVtsSpeedKnot,
        "vessel_calc_speed_knot": vesselCalcSpeedKnot,
        "vessel_heading_degree": vesselHeadingDegree,
        "pml_last_updated_at": pmlLastUpdatedAt.toIso8601String(),
      };
}
