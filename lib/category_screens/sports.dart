import 'package:flutter/cupertino.dart';

import '../theme/app_material.dart';

class Sports extends StatelessWidget {
  static String routeName = "sports";

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(AppImage.ball),fit: BoxFit.fill,);
  }
}
