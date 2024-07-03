import 'dart:convert';

class ConferenceResponseModel {
  final String status;
  final String message;
  final Data data;

  ConferenceResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ConferenceResponseModel.fromJson(String str) =>
      ConferenceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConferenceResponseModel.fromMap(Map<String, dynamic> json) =>
      ConferenceResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final String status;
  final String transactionId;
  final Conference conference;
  final Order order;
  final DateTime? conferenceApprovedAt;
  final DateTime? conferenceRejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.status,
    required this.transactionId,
    required this.conference,
    required this.order,
    this.conferenceApprovedAt,
    this.conferenceRejectedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        status: json["status"],
        transactionId: json["transaction_id"],
        conference: Conference.fromMap(json["conference"]),
        order: Order.fromMap(json["order"]),
        conferenceApprovedAt: json["conference_approved_at"] != null
            ? DateTime.parse(json["conference_approved_at"])
            : null,
        conferenceRejectedAt: json["conference_rejected_at"] != null
            ? DateTime.parse(json["conference_rejected_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "transaction_id": transactionId,
        "conference": conference.toMap(),
        "order": order.toMap(),
        "conference_approved_at": conferenceApprovedAt?.toIso8601String(),
        "conference_rejected_at": conferenceRejectedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Conference {
  final String companyName;
  final String type;
  final String location;
  final DateTime date;
  final String time;

  Conference({
    required this.companyName,
    required this.type,
    required this.location,
    required this.date,
    required this.time,
  });

  factory Conference.fromJson(String str) =>
      Conference.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Conference.fromMap(Map<String, dynamic> json) => Conference(
        companyName: json["company_name"],
        type: json["type"],
        location: json["location"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "company_name": companyName,
        "type": type,
        "location": location,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}

class Order {
  final Discharge loading;
  final Discharge discharge;
  final Consignee shipper;
  final Consignee consignee;

  Order({
    required this.loading,
    required this.discharge,
    required this.shipper,
    required this.consignee,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        loading: Discharge.fromMap(json["loading"]),
        discharge: Discharge.fromMap(json["discharge"]),
        shipper: Consignee.fromMap(json["shipper"]),
        consignee: Consignee.fromMap(json["consignee"]),
      );

  Map<String, dynamic> toMap() => {
        "loading": loading.toMap(),
        "discharge": discharge.toMap(),
        "shipper": shipper.toMap(),
        "consignee": consignee.toMap(),
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
  final int port;
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
