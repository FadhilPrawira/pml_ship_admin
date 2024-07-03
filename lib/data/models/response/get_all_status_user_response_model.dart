import 'dart:convert';

class GetAllStatusUserResponseModel {
  final String status;
  final String message;
  final List<Datum> data;

  GetAllStatusUserResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllStatusUserResponseModel.fromJson(String str) =>
      GetAllStatusUserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllStatusUserResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllStatusUserResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final String status;
  final String role;
  final User user;
  final Company company;
  final String? reasonRejected;
  final DateTime? rejectedAt;
  final DateTime? approvedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.status,
    required this.role,
    required this.user,
    required this.company,
    this.reasonRejected,
    this.rejectedAt,
    this.approvedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        status: json["status"],
        role: json["role"],
        user: User.fromMap(json["user"]),
        company: Company.fromMap(json["company"]),
        reasonRejected: json["reason_rejected"],
        rejectedAt: json["rejected_at"] != null
            ? DateTime.parse(json["rejected_at"])
            : null,
        approvedAt: json["approved_at"] != null
            ? DateTime.parse(json["approved_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "role": role,
        "user": user.toMap(),
        "company": company.toMap(),
        "reason_rejected": reasonRejected,
        "rejected_at": rejectedAt?.toIso8601String(),
        "approved_at": approvedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Company {
  final String companyName;
  final String companyAddress;
  final String companyPhone;
  final String companyEmail;
  final String companyNpwp;
  final String companyAkta;

  Company({
    required this.companyName,
    required this.companyAddress,
    required this.companyPhone,
    required this.companyEmail,
    required this.companyNpwp,
    required this.companyAkta,
  });

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyNpwp: json["company_NPWP"],
        companyAkta: json["company_akta"],
      );

  Map<String, dynamic> toMap() => {
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
        "company_akta": companyAkta,
      };
}

class User {
  final int id;
  final String name;
  final String phone;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
      };
}
