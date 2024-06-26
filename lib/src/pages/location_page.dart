import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/location_model.dart';
import 'package:rick_y_morty/src/pages/character_page.dart';
import 'package:rick_y_morty/src/providers/character_provider.dart';
import 'package:rick_y_morty/src/utils/assets_address.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/loading_indicator.dart';
import 'package:rick_y_morty/src/widgets/location_card.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key key}) : super(key: key);
  static final String routeName = "location_page";

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  CharacterProvider _characterProvider = new CharacterProvider();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    final Location location = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(title: location.name),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: GlobalSize.width * 0.05,
                      vertical: GlobalSize.heigth * 0.03),
                  child: Column(
                    children: [
                      item(key: 'Name', value: location.name),
                      item(key: 'Dimension', value: location.dimension),
                      item(key: 'Type', value: location.type),
                    ],
                  ),
                ),
                Text(
                  'Residents',
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
                    children: _createItems(location, context),
                  ),
                )
              ],
            ),
          ),
          LoadingIndicatorCustom(loading: _loading)
        ],
      ),
    );
  }

  _createItems(Location location, BuildContext context) {
    List<Widget> widgets = [];

    for (String residentId in location.getResidentsIds()) {
      widgets.add(GestureDetector(
        onTap: () async {
          _loading = true;
          setState(() {});
          Navigator.of(context).pushNamed(CharacterPage.routeName,
              arguments: await _characterProvider.getCharacterByd(
                  id: int.parse(residentId)));
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
                    'https://rickandmortyapi.com/api/character/avatar/$residentId.jpeg')),
          ),
        ),
      ));
    }
    return location.residents.length == 0
        ? [Text("There aren't residents to show.")]
        : widgets;
  }
}
