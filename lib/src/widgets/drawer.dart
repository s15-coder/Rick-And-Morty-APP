import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/pages/characters_page.dart';
import 'package:rick_y_morty/src/pages/developer_page.dart';
import 'package:rick_y_morty/src/pages/episodes_page.dart';
import 'package:rick_y_morty/src/pages/home.dart';
import 'package:rick_y_morty/src/pages/locations_page.dart';
import 'package:rick_y_morty/src/utils/assets_address.dart';
import 'package:rick_y_morty/src/utils/colors.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/utils/texts.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final TextStyle textStyle =
      TextStyle(color: Colors.black, fontSize: GlobalSize.width * 0.05);
  @override
  Widget build(BuildContext context) {
    print(GlobalSize.width * 0.05);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 1),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsPath.drawerImage),
              ),
            ),
          ),
          navItem(
              callBack: () =>
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName),
              title:GlobalText.home,
              iconData: Icons.home),
          navItem(
              callBack: () =>
                  Navigator.of(context).pushReplacementNamed(CharactersPage.routeName),
              title: GlobalText.characters,
              iconData: Icons.person),
          navItem(
              callBack: () =>
                  Navigator.of(context).pushReplacementNamed(LocationsPage.routeName),
              title: GlobalText.locations,
              iconData: Icons.location_on),
          navItem(
              callBack: () =>
                  Navigator.of(context).pushReplacementNamed(EpisodesPage.routeName),
              title: GlobalText.episodes,
              iconData: Icons.movie),
          navItem(
              callBack: () =>
                  Navigator.of(context).pushReplacementNamed(DeveloperPage.routeName),
              title: GlobalText.developer,
              iconData: Icons.code),
        ],
      ),
    );
  }

  ListTile navItem({String title, IconData iconData, VoidCallback callBack}) {
    return ListTile(
      leading: Icon(
        iconData,
        color: CustomColors.blueLight,
      ),
      onTap: callBack,
      title: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
