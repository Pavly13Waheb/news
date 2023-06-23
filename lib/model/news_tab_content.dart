import 'package:flutter/material.dart';
import 'package:news/apis_statics/sourceResponse.dart';
import '../apis_statics/ArticlesResponseDM.dart';
import '../apis_statics/apis_statics_manage.dart';

// ignore: must_be_immutable
class NewsTabContent extends StatelessWidget {
  SourceDM sourceDM;

  NewsTabContent(this.sourceDM);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponseDM>(
        future: ApisStaticsManager.getArticle(sourceDM.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("${snapshot.error.toString()}");
            return Text("${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                return articleWidget(snapshot.data!.articles![index], context);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget articleWidget(ArticleDM article, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(),
                ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Image.network(article.urlToImage!,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity),
                ),
              ],
            ),
          ),
          Text(article.author ?? "",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),
          Text(article.title ?? "",textAlign: TextAlign.center,style: TextStyle(color: Colors.green),),
          Text(article.description ?? "",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),
          Text(article.publishedAt ?? "",textAlign: TextAlign.end),
          SizedBox(height:  MediaQuery.of(context).size.height * 0.02,)
        ],
      ),
    );
  }
}
