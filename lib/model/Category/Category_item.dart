import 'package:flutter/material.dart';
import 'categoryDM.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDM;

  CategoryItem(this.categoryDM);

  @override
  Widget build(BuildContext context) {
    return Container(

      //item container
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
            Image.asset(categoryDM.image),
            Text(
              categoryDM.categoryName,
              style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),);
  }
}
