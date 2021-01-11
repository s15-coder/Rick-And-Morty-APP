import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rick_y_morty/src/models/character_model.dart';
import 'package:rick_y_morty/src/providers/providers.dart';

class CharacterProvider extends Provider {
  CharacterProvider() {
    this.localPath = "/character";
  }
  Future<Character> getCharacterByd({@required int id}) async {
    http.Response response =
        await http.get(this.baseUrl + this.localPath + "/$id");
    Character character;

    if (response.statusCode == 200) {
      Map dataCharacter = json.decode(response.body);
      character = Character.fromJson(dataCharacter);
    }
    return character;
  }

  Future<List<Character>> getCharactersByPage({@required int page}) async {
    String url = "${this.baseUrl + this.localPath}?page=$page";
    http.Response response = await http.get(url);
    List<Character> characters = [];

    if (response.statusCode == 200) {
      Map mapData = await json.decode(response.body);
      for (var mapCharacter in mapData["results"]) {
        characters.add(Character.fromJson(mapCharacter));
      }
    }

    return characters;
  }
}
