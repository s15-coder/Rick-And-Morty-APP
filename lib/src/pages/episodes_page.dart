import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/drawer.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key key}) : super(key: key);
static final String routeName = "episodes_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar(title: 'Episodes'),
    );
  }
}