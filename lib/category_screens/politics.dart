import 'package:flutter/material.dart';
import '../theme/app_material.dart';

class Politics extends StatelessWidget {
  static String routeName = "politics";

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(AppImage.politics),fit: BoxFit.fill,);
  }
}
