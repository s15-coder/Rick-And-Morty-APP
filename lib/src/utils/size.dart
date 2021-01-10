import 'package:flutter/cupertino.dart';

class GlobalSize{
  static  double width;
  static  double heigth;
 static  initSize(BuildContext context){
    heigth = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}