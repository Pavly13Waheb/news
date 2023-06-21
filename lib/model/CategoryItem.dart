import 'package:flutter/material.dart';
import 'package:news/model/categoryDM.dart';

import '../theme/app_material.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDM;
  CategoryItem(this.categoryDM);


  @override
  Widget build(BuildContext context) {

    return  Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.02,
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.backGround),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.04,
            left: MediaQuery.of(context).size.width * 0.08,
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
          color: categoryDM.containerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(categoryDM.leftRadius),
              bottomRight: Radius.circular(categoryDM.rightRadius)),
        ),
        child: Column(
          children: [
            Text(
              "Pick your category of interest",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            Text(
              categoryDM.categoryName,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
