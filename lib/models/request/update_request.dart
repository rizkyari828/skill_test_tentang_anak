import 'dart:convert';

class UpdateRequest {
  UpdateRequest({
    required this.id,
    required this.achievementName,
    this.level,
    this.organizer,
    this.year,
    this.file,
  });

  int id;
  String achievementName;
  String? level;
  String? organizer;
  String? year;
  String? file;

  factory UpdateRequest.fromRawJson(String str) =>
      UpdateRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateRequest.fromJson(Map<String, dynamic> json) => UpdateRequest(
        id: json["id"],
        achievementName: json["achievement_name"],
        level: json["level"],
        organizer: json["organizer"],
        year: json["year"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "achievement_name": achievementName,
        "level": level,
        "organizer": organizer,
        "year": year,
        "file": file,
      };
}
