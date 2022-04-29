import 'dart:convert';

class CreateRequest {
  CreateRequest({
    required this.achievementName,
    this.level,
    this.organizer,
    this.year,
    this.file,

  });

  String achievementName;
  String? level;
  String? organizer;
  String? year;
  String? file;

  factory CreateRequest.fromRawJson(String str) =>
      CreateRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateRequest.fromJson(Map<String, dynamic> json) => CreateRequest(
        achievementName: json["achievement_name"],
        level: json["level"],
        organizer: json["organizer"],
        year: json["year"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "achievement_name": achievementName,
        "level": level,
        "organizer": organizer,
        "year": year,
        "file": file,
      };
}
