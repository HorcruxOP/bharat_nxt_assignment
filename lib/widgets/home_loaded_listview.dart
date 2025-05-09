import 'package:bharat_nxt_assignment/model/article_model.dart';
import 'package:bharat_nxt_assignment/provider/article_provider.dart';
import 'package:bharat_nxt_assignment/widgets/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLoadedListview extends StatelessWidget {
  const HomeLoadedListview({
    super.key,
    required this.articles,
    required this.onRefresh,
    required this.favouriteList,
  });
  final List<ArticleModel> articles, favouriteList;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return articles.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.error),
                Text(
                  "No match found",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        : RefreshIndicator.adaptive(
            onRefresh: onRefresh,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: articles.length,
              separatorBuilder: (context, index) => SizedBox(height: 8),
              padding: EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                ArticleModel article = articles[index];
                return ArticleTile(
                  isLike: favouriteList.contains(article),
                  article: article,
                  onLikePressed: () {
                    context.read<ArticleProvider>().likeButtonFn(article);
                  },
                );
              },
            ),
          );
  }
}
