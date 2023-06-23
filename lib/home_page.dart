import 'package:flutter/material.dart';
import 'package:news/model/app_settings.dart';
import 'package:news/theme/app_material.dart';
import 'package:news/model/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model/Category/categories_tab.dart';

class HomePage extends StatefulWidget {
  static String routeName = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              AppDrawer.drawerChild(
                  onChildTap: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                  icon: Icons.list,
                  childName: AppLocalizations.of(context)!.categories,
                  context: context),
              AppDrawer.drawerChild(
                  onChildTap: () {
                    Navigator.pushNamed(context, AppSettings.routeName,
                        arguments: {});
                  },
                  icon: Icons.settings,
                  childName: AppLocalizations.of(context)!.setting,
                  context: context),
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
            child: CategoriesTab())

        // NewsEverything()

        );
  }
}
