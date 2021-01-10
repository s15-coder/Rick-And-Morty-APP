import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/character_model.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({
    Key key,
  }) : super(key: key);
  static final String routeName = "character_page";
  @override
  Widget build(BuildContext context) {
    final Character character = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(title: character.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: GlobalSize.heigth * 0.05, bottom: GlobalSize.heigth*0.02),
                child: Hero(
                  tag: character.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        height: GlobalSize.heigth * 0.28,
                        child: Image(
                          image: NetworkImage(character.image),
                        )),
                  ),
                ),
              ),
            ),
            _textsRow(key: "Name", value: character.name),
            _textsRow(key: "Gender", value: character.gender),
            _textsRow(key: "Origin", value: character.origin["name"]),
            _textsRow(key: "Location", value: character.location["name"]),
          ],
        ),
      ),
    );
  }

  Widget _textsRow({@required String key, @required String value}) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: GlobalSize.width * 0.05,
          vertical: GlobalSize.heigth * 0.04),
      child: Row(
        children: [
          Container(
            width: GlobalSize.width * 0.22,
            child: Text(
              "$key:",
              style: TextStyle(fontSize: GlobalSize.width * 0.05, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: GlobalSize.width * 0.68,
              child: Text(
                value,
                style: TextStyle(fontSize: GlobalSize.width * 0.05),
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}
