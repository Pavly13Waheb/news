import 'package:flutter/material.dart';
import '../../theme/app_material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Category_item.dart';
import 'categoryDM.dart';


class CategoriesTab extends StatefulWidget {

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    List<CategoryDM> categories = [
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
        categoryName: "science",
        //AppLocalizations.of(context)!.science,
        image: AppImage.science,
        rightRadius: 30,
        leftRadius: 0,
        containerColor: AppColor.yellowColor,
      ),
    ];
    return Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: MediaQuery.of(context).size.height * 0.08,width: MediaQuery.of(context).size.height * 0.28,

            child: Text(
              "Pick your category of interest",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30,color: AppColor.blackColor),
            ),
          ),
          Expanded(child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryItem(categories[index]);
            },
          ),)

        ]);
  }
}
