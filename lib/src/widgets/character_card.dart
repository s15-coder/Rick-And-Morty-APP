import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/character_model.dart';
import 'package:rick_y_morty/src/pages/character_page.dart';
import 'package:rick_y_morty/src/utils/assets_address.dart';
import 'package:rick_y_morty/src/utils/size.dart';

class CharacterCard extends StatefulWidget {
  const CharacterCard({Key key, @required this.character}) : super(key: key);
  final Character character;

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  double marginSide = GlobalSize.width * 0.1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (s) {
        marginSide = GlobalSize.width * 0;
        setState(() {});
      },
      onTapCancel: () {
        marginSide = GlobalSize.width * 0.1;
        setState(() {});
      },
      onTapUp: (s) {
        marginSide = GlobalSize.width * 0.1;
        setState(() {});
        Navigator.pushNamed(context, CharacterPage.routeName,
            arguments: this.widget.character);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.only(
          left: marginSide,
          right: marginSide,
          top: GlobalSize.width * 0.05,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: this.widget.character.id,
                child: Container(
                  width: double.maxFinite,
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(this.widget.character.image),
                    placeholder: AssetImage(AssetsApp.loadingGif),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: GlobalSize.heigth * 0.02),
                child: Text(widget.character.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: GlobalSize.width * 0.05)),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[50]),
            top: BorderSide(color: Colors.grey[50]),
            left: BorderSide(color: Colors.grey[50]),
            right: BorderSide(color: Colors.grey[50]),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                spreadRadius: -10,
                offset: Offset(-2, 5),
                color: Colors.grey)
          ],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
