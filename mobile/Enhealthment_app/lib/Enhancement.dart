import 'dart:convert';

Individual individualFromJson(String str) =>
    Individual.fromJson(json.decode(str));

String individualToJson(Individual data) => json.encode(data.toJson());

class Individual {
  Individual({
    this.id,
    this.name,
    this.image,
    this.enhancements,
  });

  int id;
  String name;
  String image;
  List<Enhancement> enhancements;

  factory Individual.fromJson(Map<String, dynamic> json) => Individual(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        enhancements: List<Enhancement>.from(
            json["enhancements"].map((x) => Enhancement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "enhancements": List<dynamic>.from(enhancements.map((x) => x.toJson())),
      };
}

class Enhancement {
  Enhancement({
    this.id,
    this.method,
    this.image,
  });

  int id;
  String method;
  String image;

  factory Enhancement.fromJson(Map<String, dynamic> json) => Enhancement(
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
