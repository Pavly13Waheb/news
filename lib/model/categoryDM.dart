import 'dart:js';
import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/theme/app_material.dart';

class CategoryDM {
  String image;
  String categoryName;
  Color containerColor;
  double leftRadius;
  double rightRadius;


  CategoryDM({
    required this.categoryName,
    required this.image,
    required this.rightRadius,
    required this.leftRadius,
    required this.containerColor,
  });

  static List<CategoryDM> categories = [
    CategoryDM(
      categoryName: AppLocalizations.of(context)!.sports,
      image: AppImage.ball,
      rightRadius: 0,
      leftRadius: 30,
      containerColor: AppColor.redColor,
    ),
    CategoryDM(
      categoryName: AppLocalizations.of(context)!.politics,
      image: AppImage.politics,
      rightRadius: 30,
      leftRadius: 0,
      containerColor: AppColor.blueColor,
    ),
    CategoryDM(
      categoryName: AppLocalizations.of(context)!.health,
      image: AppImage.health,
      rightRadius: 0,
      leftRadius: 30,
      containerColor: AppColor.pinkColor,
    ),
    CategoryDM(
      categoryName: AppLocalizations.of(context)!.business,
      image: AppImage.business,
      rightRadius: 30,
      leftRadius: 0,
      containerColor: AppColor.brawnColor,
    ),
    CategoryDM(
      categoryName: AppLocalizations.of(context)!.environment,
      image: AppImage.environment,
      rightRadius: 0,
      leftRadius: 30,
      containerColor: AppColor.lightBlueColor,
    ),
    CategoryDM(
      categoryName: AppLocalizations.of(context)!.science,
      image: AppImage.science,
      rightRadius: 30,
      leftRadius: 0,
      containerColor: AppColor.yellowColor,
    ),
  ];
}
