import 'package:flutter/material.dart';
import 'package:news/apis_statics/sourceResponse.dart';
import 'package:news/model/Category/categoryDM.dart';
import 'package:news/model/news_tab_content.dart';
import '../../apis_statics/apis_statics_manage.dart';
import '../../theme/app_material.dart';

// ignore: must_be_immutable
class NewsTab extends StatefulWidget {
  CategoryDM selectedCategory;

  NewsTab({required this.selectedCategory});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.backGround), fit: BoxFit.fill)),
      child: FutureBuilder<SourceResponseDM>(
        future: ApisStaticsManager.getSources(widget.selectedCategory.id),
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
    return Container(
      child: DefaultTabController(
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
            return NewsTabContent(source);
          }).toList()))
        ]),
      ),
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
