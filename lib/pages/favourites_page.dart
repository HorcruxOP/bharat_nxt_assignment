import 'package:bharat_nxt_assignment/provider/article_provider.dart';
import 'package:bharat_nxt_assignment/widgets/favourite_loaded_listview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Favourites",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: FavouriteLoadedListview(articles: provider.favouritesArticles),
        );
      },
    );
  }
}
