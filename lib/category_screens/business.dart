import 'package:flutter/material.dart';
import '../theme/app_material.dart';

class Business extends StatelessWidget {
  static String routeName = "science";

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(AppImage.business),fit: BoxFit.fill,);
  }
}
