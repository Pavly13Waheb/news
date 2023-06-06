import 'package:flutter/material.dart';
import '../theme/app_material.dart';

class Environment extends StatelessWidget {
  static String routeName = "environment";


  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(AppImage.environment),fit: BoxFit.fill,);
  }
}
