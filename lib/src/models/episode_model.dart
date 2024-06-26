
import 'dart:convert';

String episodeToJson(Episode data) => json.encode(data.toJson());

class Episode {
    Episode({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created,
    });

    int id;
    String name;
    String airDate;
    String episode;
    List<String> characters;
    String url;
    DateTime created;

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
    
  List<String> getCharactersIds() {
    List<String> residentsImages = [];
    for (int i = 0; i < characters.length; i++) {
      residentsImages.add(_getResidentId(characters[i]));
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
