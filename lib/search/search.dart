import 'package:flutter/material.dart';

import '../apis_statics/ArticlesResponseDM.dart';
import '../apis_statics/apis_statics_manage.dart';
import '../model/Category/article_details.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ifSearchQueryNull(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ifResultQueryNull(context);
  }

  ifResultQueryNull(BuildContext context) {
    if (query == "") {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Please type what you are searching for",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      );
    } else {
      return FutureBuilder<ArticlesResponseDM>(
          future: ApisStaticsManager.getArticle(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error.toString()}");
              return Text("${snapshot.error.toString()}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  return articleWidget(
                      snapshot.data!.articles![index], context);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }

  ifSearchQueryNull(BuildContext context) {
    if (query == "") {
      return close(context, null);
    } else {
      return FutureBuilder<ArticlesResponseDM>(
          future: ApisStaticsManager.getArticle(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error.toString()}");
              return Text("${snapshot.error.toString()}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  return articleWidget(
                      snapshot.data!.articles![index], context);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }

  Widget articleWidget(ArticleDM article, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routName,
            arguments: article);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
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
                    child: Image.network(article.urlToImage!,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity),
                  ),
                ],
              ),
            ),
            Text(
              article.author ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            Text(
              article.title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
            Text(article.description ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Text(article.publishedAt ?? "", textAlign: TextAlign.end),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
