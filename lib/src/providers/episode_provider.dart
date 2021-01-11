import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rick_y_morty/src/models/episode_model.dart';
import 'package:rick_y_morty/src/providers/providers.dart';

import 'package:http/http.dart' as http;

class EpisodeProvider extends Provider {
  EpisodeProvider() {
    this.localPath = "/episode";
  }
  Future<List<Episode>> getEpisodesByPage({@required int page}) async {
    http.Response response =
        await http.get(this.baseUrl + this.localPath + "?page=$page");
      List<Episode> episodes = [];
    if (response.statusCode == 200) {
      
      Map episodesData = json.decode(response.body);
      for (Map item in episodesData["results"]) {
        episodes.add(Episode.fromJson(item));
      }
    }
    return episodes;
  }
}
