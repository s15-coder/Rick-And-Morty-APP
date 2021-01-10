import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/pages/home.dart';
import 'package:rick_y_morty/src/routes/routes.dart';
import 'package:rick_y_morty/src/utils/colors.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getRoutes(),
      initialRoute: HomePage.routeName,
      theme: ThemeData(
        primaryColor: CustomColors.blueLight,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty',
    );
  }
}