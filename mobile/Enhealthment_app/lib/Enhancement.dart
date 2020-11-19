import 'dart:convert';

Enhancement enhancementFromJson(String str) =>
    Enhancement.fromJson(json.decode(str));

String enhancementToJson(Enhancement data) => json.encode(data.toJson());

class Enhancement {
  Enhancement({
    this.id,
    this.name,
    this.image,
    this.enhancements,
  });

  int id;
  String name;
  String image;
  List<EnhancementElement> enhancements;

  factory Enhancement.fromJson(Map<String, dynamic> json) => Enhancement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        enhancements: List<EnhancementElement>.from(
            json["enhancements"].map((x) => EnhancementElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "enhancements": List<dynamic>.from(enhancements.map((x) => x.toJson())),
      };
}

class EnhancementElement {
  EnhancementElement({
    this.id,
    this.method,
    this.image,
  });

  int id;
  String method;
  String image;

  factory EnhancementElement.fromJson(Map<String, dynamic> json) =>
      EnhancementElement(
        id: json["id"],
        method: json["method"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "method": method,
        "image": image,
      };
}
