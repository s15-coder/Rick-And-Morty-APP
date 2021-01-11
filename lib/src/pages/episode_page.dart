import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/episode_model.dart';
import 'package:rick_y_morty/src/pages/character_page.dart';
import 'package:rick_y_morty/src/providers/character_provider.dart';
import 'package:rick_y_morty/src/utils/assets_address.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/loading_indicator.dart';
import 'package:rick_y_morty/src/widgets/location_card.dart';

class EpisodePage extends StatefulWidget {
  const EpisodePage({Key key}) : super(key: key);
  static final String routeName = "episode_page";

  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
    CharacterProvider _characterProvider = new CharacterProvider();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    final Episode episode = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(title: episode.name),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: GlobalSize.width * 0.05,
                      vertical: GlobalSize.heigth * 0.03),
                  child: Column(
                    children: [
                      item(key: 'Name', value: episode.name),
                      item(key: 'Air Date', value: episode.airDate),
                    ],
                  ),
                ),
                Text(
                  'Characters',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: GlobalSize.width * 0.08),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: GlobalSize.width * 0.01,
                      vertical: GlobalSize.heigth * 0.02),
                  child: Wrap(
                    runAlignment: WrapAlignment.end,
                    children: _createItems(episode, context),
                  ),
                )
              ],
            ),
            LoadingIndicatorCustom(loading: _loading)
          ],
        ),
      ),
    );
  }

  List<Widget> _createItems(Episode episode, BuildContext context) {
    List<Widget> widgets = [];

    for (String characterId in episode.getCharactersIds()) {
      widgets.add(GestureDetector(
        onTap: () async {
          _loading = true;
          setState(() {});
          Navigator.of(context).pushNamed(CharacterPage.routeName,
              arguments: await _characterProvider
                  .getCharacterByd(id: int.parse(characterId)));
          _loading = false;
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.all(GlobalSize.width * 0.02),
          width: GlobalSize.width * 0.19,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
                placeholder: AssetImage(AssetsApp.loadingGif),
                image: NetworkImage(
                    "https://rickandmortyapi.com/api/character/avatar/$characterId.jpeg")),
          ),
        ),
      ));
    }
    return widgets;
  }
}
