import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/model/Category/every_thing.dart';
import 'package:news/model/app_settings.dart';
import 'package:news/model/drawer.dart';
import 'package:news/search/search.dart';
import 'package:news/theme/app_material.dart';

import 'model/Category/categories_tab.dart';
import 'model/Category/categoryDM.dart';

class HomePage extends StatefulWidget {
  static String routeName = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryDM? selectedCategory;
  late Widget selectedTap;

  @override
  void initState() {
    super.initState();
    selectedTap = CategoriesTab(setSelectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selectedTap is CategoriesTab) {
          return Future.value(true);
        } else {
          selectedTap = CategoriesTab(setSelectedCategory);
          return Future.value(false);
        }
      },
      child: Scaffold(
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
                      selectedCategory = null;
                      selectedTap = CategoriesTab(setSelectedCategory);
                      Navigator.pop(context);
                      setState(() {});
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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 50,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: NewsSearch());
                },
              )
            ],
            title: Text(AppLocalizations.of(context)!.newsApp),
          ),
          body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImage.backGround),
                      fit: BoxFit.fill)),
              child: selectedTap)),
    );
  }

  void setSelectedCategory(CategoryDM category) {
    selectedCategory = category;
    selectedTap = NewsTab(selectedCategory: selectedCategory!);
    setState(() {});
  }
}
