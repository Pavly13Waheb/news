import 'package:flutter/material.dart';
import '../../theme/app_material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Category_item.dart';
import 'categoryDM.dart';

class CategoriesTab extends StatelessWidget {
  Function(CategoryDM) onCategoryClick;

  CategoriesTab(this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    List<CategoryDM> categories = [
      CategoryDM(
        id: "sports",
        categoryName: AppLocalizations.of(context)!.sports,
        image: AppImage.ball,
        rightRadius: 0,
        leftRadius: 30,
        containerColor: AppColor.redColor,
      ),
      CategoryDM(
        id: "entertainment",
        categoryName: AppLocalizations.of(context)!.entertainment,
        image: AppImage.entertainment,
        rightRadius: 30,
        leftRadius: 0,
        containerColor: AppColor.blueColor,
      ),
      CategoryDM(
        id: "health",
        categoryName: AppLocalizations.of(context)!.health,
        image: AppImage.health,
        rightRadius: 0,
        leftRadius: 30,
        containerColor: AppColor.pinkColor,
      ),
      CategoryDM(
        id: "business",
        categoryName: AppLocalizations.of(context)!.business,
        image: AppImage.business,
        rightRadius: 30,
        leftRadius: 0,
        containerColor: AppColor.brawnColor,
      ),
      CategoryDM(
        id: "technology",
        categoryName: AppLocalizations.of(context)!.technology,
        image: AppImage.technology,
        rightRadius: 0,
        leftRadius: 30,
        containerColor: AppColor.lightBlueColor,
      ),
      CategoryDM(
        id: "science",
        categoryName: AppLocalizations.of(context)!.science,
        image: AppImage.science,
        rightRadius: 30,
        leftRadius: 0,
        containerColor: AppColor.yellowColor,
      ),
    ];
    return Container(
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
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.height * 0.32,
            child: Text(
              "Pick your category of interest",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30, color: AppColor.blackColor),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.08,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.02),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: CategoryItem(categories[index]),
                    onTap: () {
                      onCategoryClick(categories[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
