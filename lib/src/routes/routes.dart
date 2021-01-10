import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/pages/character_page.dart';
import 'package:rick_y_morty/src/pages/characters_page.dart';
import 'package:rick_y_morty/src/pages/developer_page.dart';
import 'package:rick_y_morty/src/pages/episodes_page.dart';
import 'package:rick_y_morty/src/pages/home.dart';
import 'package:rick_y_morty/src/pages/location_page.dart';
import 'package:rick_y_morty/src/pages/locations_page.dart';
Map<String, Widget Function(BuildContext)> getRoutes()=>{
  HomePage.routeName : (BuildContext context)=>HomePage(),
  CharactersPage.routeName : (BuildContext context)=>CharactersPage(),
  CharacterPage.routeName : (BuildContext context)=>CharacterPage(),
  LocationsPage.routeName : (BuildContext context)=>LocationsPage(),
  LocationPage.routeName : (BuildContext context)=>LocationPage(),
  EpisodesPage.routeName : (BuildContext context)=>EpisodesPage(),
  DeveloperPage.routeName : (BuildContext context)=>DeveloperPage(),
};