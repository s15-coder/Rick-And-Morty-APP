import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/episode_model.dart';
import 'package:rick_y_morty/src/providers/episode_provider.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/drawer.dart';
import 'package:rick_y_morty/src/widgets/episode_card.dart';
import 'package:rick_y_morty/src/widgets/loading_indicator.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({Key key}) : super(key: key);
static final String routeName = "episodes_page";

  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
   EpisodeProvider _episodeProvider = new EpisodeProvider();
  ScrollController _scrollController = new ScrollController();
  List<Episode> _episodes = [];
  int _page = 1;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    fetchEpisodes();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchEpisodes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar(title: 'Episodes'),
      body:  Stack(
          children: [
            _listBuilder(context),
            LoadingIndicatorCustom(
              loading: _loading,
            )
          ],
        ));
  }
    Future fetchEpisodes() async {
    _loading = true;
    setState(() {});
    _episodes += await _episodeProvider.getEpisodesByPage(page: this._page);
    _page++;
    _loading = false;
    setState(() {});
    _scrollController.animateTo(_scrollController.position.pixels + 50,
        duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }
  Widget _listBuilder(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _episodes.length,
        itemBuilder: (BuildContext context, int index) {
          return EpisodeCard(episode: _episodes[index],);
        });
  }

}