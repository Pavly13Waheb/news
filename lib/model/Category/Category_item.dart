import 'package:flutter/material.dart';
import 'categoryDM.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDM;

  CategoryItem(this.categoryDM);

  @override
  Widget build(BuildContext context) {
    return Container(
      //item container
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
          Image.asset(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.15,
              categoryDM.image,
              fit: BoxFit.fill),
          Text(
            categoryDM.categoryName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
