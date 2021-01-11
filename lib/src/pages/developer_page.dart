import 'package:flutter/material.dart';
import 'package:rick_y_morty/src/utils/assets_address.dart';
import 'package:rick_y_morty/src/utils/size.dart';
import 'package:rick_y_morty/src/utils/utils.dart';
import 'package:rick_y_morty/src/widgets/app_bar.dart';
import 'package:rick_y_morty/src/widgets/circle_photo.dart';
import 'package:rick_y_morty/src/widgets/drawer.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key key}) : super(key: key);
  static final String routeName = "developer_page";
  static final String facebookUrl = "https://facebook.com/SergioEstebanBM/";
  static final String instagramUrl = "https://instragram.com/BetterCallEsteban/";
  static final String githubUrl = "https://github.com/s15-coder";
  static final String emailUrl = "mailto:serestebanoo@gmail.com?subject=Development Subject&body= ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: appBar(title: 'Developer'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircularPhoto(),
            Container(
              margin: EdgeInsets.only(bottom: GlobalSize.heigth * 0.03),
              width: GlobalSize.width,
              child: Text(
                'Sergio Esteban Barragan Muñoz',
                style: TextStyle(
                    fontSize: GlobalSize.width * 0.06,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _socialButton(imagePath: AssetsApp.facebook, callback: ()async => await Utils.launchUrl(url:facebookUrl)),
                _socialButton(imagePath: AssetsApp.instagram, callback: ()async => await Utils.launchUrl(url:instagramUrl)),
                _socialButton(imagePath: AssetsApp.gmail, callback:()async => await Utils.launchUrl(url:emailUrl)),
                _socialButton(imagePath: AssetsApp.github, callback: ()async =>await  Utils.launchUrl(url:githubUrl)),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: GlobalSize.heigth * 0.03,
                  horizontal: GlobalSize.width * 0.05),
              child: Text(
                'I\'m a passionate software developer who loves the technology. Knowledge in: Javascript, Flutter, Java, Node.js, MongoDB, HTML, CSS, Git, GitHub.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: GlobalSize.width * 0.045),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _socialButton(
      {@required String imagePath, @required VoidCallback callback}) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: GlobalSize.width * 0.08,
        child: Image(
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
