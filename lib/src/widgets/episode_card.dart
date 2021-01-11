import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/episode_model.dart';
import 'package:rick_y_morty/src/pages/episode_page.dart';

import 'location_card.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({Key key, @required this.episode}) : super(key: key);
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EpisodePage.routeName,arguments: episode);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              item(key: "Name", value: episode.name),
              item(key: "Air Date", value: episode.airDate),
            ],
          ),
        ),
      ),
    );
  }

}