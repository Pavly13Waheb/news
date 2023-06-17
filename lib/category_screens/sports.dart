import 'package:flutter/material.dart';
import 'package:news/sourceResponse.dart';
import 'package:news/spis_statics/apis_statics_manage.dart';
import '../theme/app_material.dart';

class Sports extends StatelessWidget {
  static String routeName = "sports";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SourceResponseDM>(
        future: ApisStaticsManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            return getScreenBody(snapshot.data!.sources!);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          ;
        },
      ),
    );
  }

  Widget getScreenBody(List<SourceDM> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(children: [
        Expanded(
          child: TabBar(
            isScrollable: true,
              tabs: sources.map((source) {
            return getTab(source);
          }).toList()),
        ),
        Expanded(
            child: TabBarView(
                children: sources.map((source) {
          return Text(source.name!);
        }).toList()))
      ]),
    );
  }

  Widget getTab(SourceDM source) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.greenColor, borderRadius: BorderRadius.circular(10)),
      child: Text(source.name ?? ""),
    );
  }
}
