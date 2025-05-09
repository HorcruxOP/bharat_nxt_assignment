import 'package:bharat_nxt_assignment/model/article_model.dart';
import 'package:bharat_nxt_assignment/provider/article_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  static route({
    required ArticleModel article,
  }) =>
      CupertinoPageRoute(
        builder: (context) => ArticleDetailsPage(
          article: article,
        ),
        fullscreenDialog: true,
      );

  @override
  Widget build(BuildContext context) {
    bool isLike = context.watch<ArticleProvider>().isFavourite(article);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Article Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ArticleProvider>().likeButtonFn(article);
            },
            icon: Icon(
              isLike ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: isLike ? Colors.red : null,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              article.body,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
