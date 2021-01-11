class Location {
  Location({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  DateTime created;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };

  List<String> getResidentsIds() {
    List<String> residentsImages = [];
    for (int i = 0; i < residents.length; i++) {
      residentsImages.add(_getResidentId(residents[i]));
    }
    return residentsImages;
  }

  String _getResidentId(String resident) {
    String id = "";
    for (int i = resident.length; i > 0; i--) {
      String lastLetter = resident.substring(i - 1, i);
      try {
        int.parse(lastLetter);
        id = lastLetter + id;
      } catch (e) {
        break;
      }
    }
    return id;
  }
}
