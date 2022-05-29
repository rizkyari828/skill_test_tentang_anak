// To parse this JSON data, do
//
//     final listFruitResponse = listFruitResponseFromJson(jsonString);

import 'dart:convert';

ListFruitResponse listFruitResponseFromJson(String str) =>
    ListFruitResponse.fromJson(json.decode(str));

String listFruitResponseToJson(ListFruitResponse data) =>
    json.encode(data.toJson());

class ListFruitResponse {
  ListFruitResponse({
    this.message,
    this.code,
    this.data,
  });

  String? message;
  int? code;
  Data? data;

  factory ListFruitResponse.fromJson(Map<String, dynamic> json) =>
      ListFruitResponse(
        message: json["message"] == null ? null : json["message"],
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "code": code == null ? null : code,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.imagesReferences,
    this.fruits,
  });

  ImagesReferences? imagesReferences;
  List<Fruit>? fruits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imagesReferences: json["imagesReferences"] == null
            ? null
            : ImagesReferences.fromJson(json["imagesReferences"]),
        fruits: json["fruits"] == null
            ? null
            : List<Fruit>.from(json["fruits"].map((x) => Fruit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "imagesReferences":
            imagesReferences == null ? null : imagesReferences?.toJson(),
        "fruits": fruits == null
            ? null
            : List<dynamic>.from(fruits!.map((x) => x.toJson())),
      };
}

class Fruit {
  Fruit({
    this.name,
    this.price,
    this.total,
    this.img,
  });

  String? name;
  int? price;
  int? total;
  String? img;

  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "price": price == null ? null : price,
      };
}

class ImagesReferences {
  ImagesReferences({
    this.apple,
    this.manggo,
    this.banana,
    this.avocado,
    this.melon,
  });

  String? apple;
  String? manggo;
  String? banana;
  String? avocado;
  String? melon;

  factory ImagesReferences.fromJson(Map<String, dynamic> json) =>
      ImagesReferences(
        apple: json["apple"] == null ? null : json["apple"],
        manggo: json["manggo"] == null ? null : json["manggo"],
        banana: json["banana"] == null ? null : json["banana"],
        avocado: json["avocado"] == null ? null : json["avocado"],
        melon: json["melon"] == null ? null : json["melon"],
      );

  Map<String, dynamic> toJson() => {
        "apple": apple == null ? null : apple,
        "manggo": manggo == null ? null : manggo,
        "banana": banana == null ? null : banana,
        "avocado": avocado == null ? null : avocado,
        "melon": melon == null ? null : melon,
      };
}
