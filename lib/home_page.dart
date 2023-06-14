import 'package:flutter/material.dart';
import 'package:news/app_settings.dart';
import 'package:news/theme/app_material.dart';
import 'category_screens/business.dart';
import 'category_screens/environment.dart';
import 'category_screens/health.dart';
import 'category_screens/politics.dart';
import 'category_screens/science.dart';
import 'category_screens/sports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static String routeName = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    Business(),
    Environment(),
    Health(),
    Politics(),
    Science(),
    Sports()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                color: AppColor.greenColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Text(AppLocalizations.of(context)!.newsAp)),
            drawerChild(
                onChildTap: () {Navigator.pushNamed(context, HomePage.routeName);},
                icon: Icons.list,
                childName: AppLocalizations.of(context)!.categories),
            drawerChild(
                onChildTap: () {
                  Navigator.pushNamed(context, AppSettings.routeName,
                      arguments: {});
                },
                icon: Icons.settings,
                childName: AppLocalizations.of(context)!.setting),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newsApp),
      ),
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  widgetLeftButton(
                      image: AppImage.ball,
                      onCategoryTap: () {Navigator.pushNamed(context, Sports.routeName);},
                      containerColor: AppColor.redColor,
                      categoryName: AppLocalizations.of(context)!.sports),
                  widgetRightButton(
                      image: AppImage.politics,
                      onCategoryTap: () {Navigator.pushNamed(context, Politics.routeName);},
                      containerColor: AppColor.blueColor,
                      categoryName: AppLocalizations.of(context)!.politics),
                ],
              ),
              Row(
                children: [
                  widgetLeftButton(
                      image: AppImage.health,
                      onCategoryTap: () {Navigator.pushNamed(context, Health.routeName);},
                      containerColor: AppColor.pinkColor,
                      categoryName: AppLocalizations.of(context)!.health),
                  widgetRightButton(
                      image: AppImage.business,
                      onCategoryTap: () {Navigator.pushNamed(context, Business.routeName);},
                      containerColor: AppColor.brawnColor,
                      categoryName: AppLocalizations.of(context)!.science),
                ],
              ),
              Row(
                children: [
                  widgetLeftButton(
                      image: AppImage.environment,
                      onCategoryTap: () {Navigator.pushNamed(context, Environment.routeName);},
                      containerColor: AppColor.lightBlueColor,
                      categoryName: AppLocalizations.of(context)!.environment),
                  widgetRightButton(
                      image: AppImage.science,
                      onCategoryTap: () {Navigator.pushNamed(context, Science.routeName);},
                      containerColor: AppColor.yellowColor,
                      categoryName: AppLocalizations.of(context)!.science),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  widgetLeftButton(
      {required String image,
      required String categoryName,
      required Function() onCategoryTap,
      required Color containerColor}) {
    return Container(
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.08,
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap:
              onCategoryTap
            ,
            child: Image(
              image: AssetImage(image),
              width: 130,
              height: 150,
            ),
          ),
          Text(
            categoryName,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  widgetRightButton(
      {required String image,
      required String categoryName,
      required Function() onCategoryTap,
      required Color containerColor}) {
    return Container(
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.08,
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap:
              onCategoryTap,
            child: Image(
              image: AssetImage(image),
              width: 130,
              height: 150,
            ),
          ),
          Text(
            categoryName,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  drawerChild(
      {required IconData icon,
      required String childName,
      required Function() onChildTap}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: InkWell(
              onTap: onChildTap,
              child: Row(
                children: [
                  Icon(icon, size: 30),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      childName,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

