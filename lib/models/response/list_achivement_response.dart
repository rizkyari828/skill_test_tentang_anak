// To parse this JSON data, do
//
//     final listAchivementResponse = listAchivementResponseFromJson(jsonString);

import 'dart:convert';

ListAchivementResponse listAchivementResponseFromJson(String str) =>
    ListAchivementResponse.fromJson(json.decode(str));

String listAchivementResponseToJson(ListAchivementResponse data) =>
    json.encode(data.toJson());

class ListAchivementResponse {
  ListAchivementResponse({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  bool? success;
  int? code;
  String? message;
  List<Achivement>? data;

  factory ListAchivementResponse.fromJson(Map<String, dynamic> json) =>
      ListAchivementResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<Achivement>.from(
            json["data"].map((x) => Achivement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Achivement {
  Achivement({
    this.id,
    this.userId,
    this.achievementName,
    this.level,
    this.organizer,
    this.year,
    this.file,
  });

  int? id;
  String? userId;
  String? achievementName;
  String? level;
  String? organizer;
  String? year;
  String? file;

  factory Achivement.fromJson(Map<String, dynamic> json) => Achivement(
        id: json["id"],
        userId: json["user_id"],
        achievementName: json["achievement_name"],
        level: json["level"],
        organizer: json["organizer"],
        year: json["year"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "achievement_name": achievementName,
        "level": level,
        "organizer": organizer,
        "year": year,
        "file": file,
      };
}
