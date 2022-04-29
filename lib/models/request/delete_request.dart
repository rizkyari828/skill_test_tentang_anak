import 'dart:convert';

class DeleteRequest {
  DeleteRequest({
    required this.id,
  });

  int id;

  factory DeleteRequest.fromRawJson(String str) =>
      DeleteRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteRequest.fromJson(Map<String, dynamic> json) => DeleteRequest(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
