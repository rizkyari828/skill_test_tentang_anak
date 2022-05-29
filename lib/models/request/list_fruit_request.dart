// To parse this JSON data, do
//
//     final listFruitsRequest = listFruitsRequestFromJson(jsonString);

import 'dart:convert';

ListFruitsRequest listFruitsRequestFromJson(String str) => ListFruitsRequest.fromJson(json.decode(str));

String listFruitsRequestToJson(ListFruitsRequest data) => json.encode(data.toJson());

class ListFruitsRequest {
    ListFruitsRequest({
        this.data,
    });

    DataReference? data;

    factory ListFruitsRequest.fromJson(Map<String, dynamic> json) => ListFruitsRequest(
        data: DataReference.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class DataReference {
    DataReference({
        this.imageReferences,
        this.referenceId,
    });

    bool? imageReferences;
    String? referenceId;

    factory DataReference.fromJson(Map<String, dynamic> json) => DataReference(
        imageReferences: json["imageReferences"],
        referenceId: json["referenceId"],
    );

    Map<String, dynamic> toJson() => {
        "imageReferences": imageReferences,
        "referenceId": referenceId,
    };
}
