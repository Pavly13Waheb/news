import 'package:flutter/material.dart';
import '../theme/app_material.dart';

class Health extends StatelessWidget {
  static String routeName = "health";

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(AppImage.health),fit: BoxFit.fill,);
  }
}
