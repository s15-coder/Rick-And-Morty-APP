import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/utils/colors.dart';
import 'package:rick_y_morty/src/utils/size.dart';

class CircularPhoto extends StatelessWidget {
  const CircularPhoto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: GlobalSize.heigth *0.04),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: CustomColors.blueLight,
          borderRadius: BorderRadius.circular(200)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Container(
          width: GlobalSize.width * 0.4,
          child: Image(
            image: AssetImage('assets/my_photo.jpg'),
          ),
        ),
      ),
    );
  }
}
