import 'dart:convert';

class GetAllStatusUserResponseModel {
  final List<Datum> data;

  GetAllStatusUserResponseModel({
    required this.data,
  });

  factory GetAllStatusUserResponseModel.fromJson(String str) =>
      GetAllStatusUserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllStatusUserResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllStatusUserResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final int id;
  final String status;
  final String role;
  final String name;
  final String phone;
  final String email;
  final DateTime? emailVerifiedAt;
  final String companyName;
  final String companyAddress;
  final String companyPhone;
  final String companyEmail;
  final String companyNpwp;
  final String companyAktaUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? rejectedDate;
  final DateTime? approvedDate;
  final DateTime? deletedAt;

  Datum({
    required this.id,
    required this.status,
    required this.role,
    required this.name,
    required this.phone,
    required this.email,
    this.emailVerifiedAt,
    required this.companyName,
    required this.companyAddress,
    required this.companyPhone,
    required this.companyEmail,
    required this.companyNpwp,
    required this.companyAktaUrl,
    required this.createdAt,
    required this.updatedAt,
    this.rejectedDate,
    this.approvedDate,
    this.deletedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        role: json["role"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.parse(json["email_verified_at"])
            : null,
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyNpwp: json["company_NPWP"],
        companyAktaUrl: json["company_akta_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rejectedDate: json["rejectedDate"] != null
            ? DateTime.parse(json["rejectedDate"])
            : null,
        approvedDate: json["approvedDate"] != null
            ? DateTime.parse(json["approvedDate"])
            : null,
        deletedAt: json["deleted_at"] != null
            ? DateTime.parse(json["deleted_at"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "role": role,
        "name": name,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
        "company_akta_url": companyAktaUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rejectedDate": rejectedDate?.toIso8601String(),
        "approvedDate": approvedDate?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
      };
}
