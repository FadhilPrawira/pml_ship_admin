import 'dart:convert';

class GetAllPaymentsResponseModel {
  final String status;
  final String message;
  final List<Datum> data;

  GetAllPaymentsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllPaymentsResponseModel.fromJson(String str) =>
      GetAllPaymentsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllPaymentsResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllPaymentsResponseModel(
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
  final int id;
  final String orderTransactionId;
  final DateTime? paymentDate;
  final DateTime? paymentDueDate;
  final int paymentAmount;
  final String paymentProofDocument;
  final int installmentNumber;
  final int? totalInstallments;
  final String paymentStatus;
  final DateTime? approvedAt;
  final DateTime? rejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.orderTransactionId,
    this.paymentDate,
    this.paymentDueDate,
    required this.paymentAmount,
    required this.paymentProofDocument,
    required this.installmentNumber,
    this.totalInstallments,
    required this.paymentStatus,
    this.approvedAt,
    this.rejectedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderTransactionId: json["order_transaction_id"],
        paymentDate: json["payment_date"] != null
            ? DateTime.parse(json["payment_date"])
            : null,
        paymentDueDate: json["payment_due_date"] != null
            ? DateTime.parse(json["payment_due_date"])
            : null,
        paymentAmount: json["payment_amount"],
        paymentProofDocument: json["payment_proof_document"],
        installmentNumber: json["installment_number"],
        totalInstallments: json["total_installments"],
        paymentStatus: json["payment_status"],
        approvedAt: json["approved_at"] != null
            ? DateTime.parse(json["approved_at"])
            : null,
        rejectedAt: json["rejected_at"] != null
            ? DateTime.parse(json["rejected_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_transaction_id": orderTransactionId,
        "payment_date":
            "${paymentDate?.year.toString().padLeft(4, '0')}-${paymentDate?.month.toString().padLeft(2, '0')}-${paymentDate?.day.toString().padLeft(2, '0')}",
        "payment_due_date": paymentDueDate?.toIso8601String(),
        "payment_amount": paymentAmount,
        "payment_proof_document": paymentProofDocument,
        "installment_number": installmentNumber,
        "total_installments": totalInstallments,
        "payment_status": paymentStatus,
        "approved_at": approvedAt?.toIso8601String(),
        "rejected_at": rejectedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
