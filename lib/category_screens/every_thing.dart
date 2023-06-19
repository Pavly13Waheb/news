import 'package:flutter/material.dart';
import 'package:news/apis_statics/sourceResponse.dart';
import 'package:news/category_screens/tab_content.dart';
import '../apis_statics/apis_statics_manage.dart';
import '../app_settings.dart';
import '../home_page.dart';
import '../theme/app_material.dart';
import '../theme/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsEverything extends StatefulWidget {
  static String routeName = "newsEverything";

  @override
  State<NewsEverything> createState() => _NewsEverythingState();
}

class _NewsEverythingState extends State<NewsEverything> {
  int currentTab = 0;

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
        title: Text("News"),
      ),
      body: FutureBuilder<SourceResponseDM>(
        future: ApisStaticsManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            return getScreenBody(
              snapshot.data!.sources!,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget getScreenBody(
      List<SourceDM> sources,
      ) {
    return DefaultTabController(
      length: sources.length,
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(5),
          child: TabBar(
              indicatorColor: Colors.transparent,
              onTap: (index) {
                currentTab = index;
                setState(() {});
              },
              isScrollable: true,
              tabs: sources.map((source) {
                return getTab(source, currentTab == sources.indexOf(source));
              }).toList()),
        ),
        Expanded(
            child: TabBarView(
                children: sources.map((source) {
                  return TabContent(source);
                }).toList()))
      ]),
    );
  }

  Widget getTab(SourceDM source, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.greenColor),
          color: isSelected ? AppColor.greenColor : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected ? AppColor.whiteColor : AppColor.greenColor),
      ),
    );
  }

}
