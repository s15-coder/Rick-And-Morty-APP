import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/utils/colors.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/circle_photo.dart';
import 'package:rick_y_morty/src/widgets/drawer.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key key}) : super(key: key);
  static final String routeName = "developer_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar(title: 'Developer'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: CircularPhoto()),
            Container(
              width: GlobalSize.width,
              child: Text(
                'Sergio Esteban Barragan Muñoz',
                style: TextStyle(fontSize: GlobalSize.width * 0.06, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
