import 'package:flutter/material.dart';

class CategoryDM {
  String id;
  String image;
  String categoryName;
  Color containerColor;
  double leftRadius;
  double rightRadius;

  CategoryDM({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.rightRadius,
    required this.leftRadius,
    required this.containerColor,
  });
}
