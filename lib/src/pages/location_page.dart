import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/location_model.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/location_card.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key key}) : super(key: key);
  static final String routeName = "location_page";

  @override
  Widget build(BuildContext context) {
    final Location location = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(title: location.name),
      body: SingleChildScrollView(
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
                children: _createItems(location),
              ),
            )
          ],
        ),
      ),
    );
  }

  _createItems(Location location) {
    List<Widget> widgets = [];
    
    for (String imagePath in location.getResidentsImages()) {
      widgets.add( Container(
          margin: EdgeInsets.all(GlobalSize.width * 0.02),
          width: GlobalSize.width * 0.19,
          child:ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(imagePath)),
        ),
      ));
    }
    return location.residents.length == 0 ?[ Text("There aren't residents to show.")]: widgets;
  }
}
