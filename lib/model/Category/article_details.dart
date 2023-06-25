import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/apis_statics/ArticlesResponseDM.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_page.dart';
import '../../theme/app_material.dart';
import '../app_settings.dart';
import '../drawer.dart';

class NewsDetailsScreen extends StatelessWidget {
  static String routName = "NewsDetailsScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ArticleDM;
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
        title: Text("News Details"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.backGround), fit: BoxFit.fill),
        ),
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(args.urlToImage!,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity),
                  ),
                ],
              ),
            ),
            Text(
              args.author ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            Text(
              args.title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
            Text(args.description ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Text(args.publishedAt ?? "", textAlign: TextAlign.end),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(args.content ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            InkWell(
              onTap: () {
                openUrl(args.url);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View Full Article"),
                  Icon(Icons.play_arrow_sharp)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    var uri = Uri.parse(url!);
    // ignore: unnecessary_null_comparison
    if (url == null) {
      return;
    } else if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
