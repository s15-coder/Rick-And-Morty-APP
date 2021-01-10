import 'package:flutter/material.dart';

import 'package:rick_y_morty/src/models/character_model.dart';
import 'package:rick_y_morty/src/providers/character_provider.dart';
import 'package:rick_y_morty/src/utils/texts.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/character_card.dart';
import 'package:rick_y_morty/src/widgets/drawer.dart';
import 'package:rick_y_morty/src/widgets/loading_indicator.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({
    Key key,
  }) : super(key: key);
  static final routeName = "characters_page";

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  CharacterProvider _characterProvider = new CharacterProvider();
  ScrollController _scrollController = new ScrollController();
  List<Character> _charactersList = [];
  int _page = 1;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    fetchCharacters();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar(title: GlobalText.characters),
      body: Stack(
        children: [
          _listBuilder(context),
          LoadingIndicatorCustom(
            loading: _loading,
          )
        ],
      ),
    );
  }

  Future fetchCharacters() async {
    //Enable circular progess
    _loading = true;
    setState(() {});

    //Add new character.
    _charactersList += await _characterProvider.getCharactersByPage(page: _page);
    _page++;

    //Unable circular progress
    _loading = false;
    setState(() {});

    _scrollController.animateTo(_scrollController.position.pixels + 50,
        duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
  }

  ListView _listBuilder(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _charactersList.length,
        itemBuilder: (BuildContext context, int index) {
          return CharacterCard(
            character: _charactersList[index],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }
}
