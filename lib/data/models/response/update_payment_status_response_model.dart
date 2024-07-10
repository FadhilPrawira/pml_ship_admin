import 'dart:convert';

class UpdatePaymentStatusResponseModel {
  final String? status;
  final String? message;
  final Data? data;

  UpdatePaymentStatusResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UpdatePaymentStatusResponseModel.fromJson(String str) =>
      UpdatePaymentStatusResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePaymentStatusResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdatePaymentStatusResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final int? id;
  final String? orderTransactionId;
  final DateTime? paymentDate;
  final DateTime? paymentDueDate;
  final int? paymentAmount;
  final String? paymentProofDocument;
  final int? installmentNumber;
  final dynamic totalInstallments;
  final String? paymentStatus;
  final DateTime? approvedAt;
  final dynamic rejectedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.orderTransactionId,
    this.paymentDate,
    this.paymentDueDate,
    this.paymentAmount,
    this.paymentProofDocument,
    this.installmentNumber,
    this.totalInstallments,
    this.paymentStatus,
    this.approvedAt,
    this.rejectedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        orderTransactionId: json["order_transaction_id"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        paymentDueDate: json["payment_due_date"] == null
            ? null
            : DateTime.parse(json["payment_due_date"]),
        paymentAmount: json["payment_amount"],
        paymentProofDocument: json["payment_proof_document"],
        installmentNumber: json["installment_number"],
        totalInstallments: json["total_installments"],
        paymentStatus: json["payment_status"],
        approvedAt: json["approved_at"] == null
            ? null
            : DateTime.parse(json["approved_at"]),
        rejectedAt: json["rejected_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_transaction_id": orderTransactionId,
        "payment_date":
            "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
        "payment_due_date": paymentDueDate?.toIso8601String(),
        "payment_amount": paymentAmount,
        "payment_proof_document": paymentProofDocument,
        "installment_number": installmentNumber,
        "total_installments": totalInstallments,
        "payment_status": paymentStatus,
        "approved_at": approvedAt?.toIso8601String(),
        "rejected_at": rejectedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
