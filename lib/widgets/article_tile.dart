import 'package:bharat_nxt_assignment/model/article_model.dart';
import 'package:bharat_nxt_assignment/pages/article_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.article,
    this.onLikePressed,
    required this.isLike,
  });

  final ArticleModel article;
  final bool isLike;
  final void Function()? onLikePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          ArticleDetailsPage.route(article: article),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    article.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: onLikePressed,
                  icon: Icon(
                    isLike ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: isLike ? Colors.red : null,
                  ),
                ),
              ],
            ),
            Text(
              article.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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
