import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/models/location_model.dart';
import 'package:rick_y_morty/src/pages/location_page.dart';
import 'package:rick_y_morty/src/utils/size.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key key, @required this.location}) : super(key: key);
  final Location location;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LocationPage.routeName,arguments: location);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              item(key: "Name", value: location.name),
              item(key: "Dimensión", value: location.dimension),
            ],
          ),
        ),
      ),
    );
  }

}
 Widget item({@required String key, @required String value}) {
    return Container(
      margin: EdgeInsets.only(
        top: GlobalSize.heigth * 0.02,
        bottom: GlobalSize.heigth * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$key:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
