import 'package:bharat_nxt_assignment/provider/article_provider.dart';
import 'package:bharat_nxt_assignment/widgets/home_empty_widget.dart';
import 'package:bharat_nxt_assignment/widgets/home_loaded_listview.dart';
import 'package:bharat_nxt_assignment/widgets/home_loading_widget.dart';
import 'package:bharat_nxt_assignment/widgets/home_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "All Articles",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          body: provider.isLoading
              ? HomeLoadingWidget()
              : provider.articles.isEmpty
                  ? HomeEmptyWidget()
                  : Column(
                      children: [
                        HomeTextfieldWidget(
                          controller: provider.searchController,
                          onCrossButton: () {
                            provider.clearController();
                          },
                          onChanged: (value) {
                            provider.filterArticles(value);
                          },
                        ),
                        Expanded(
                          child: HomeLoadedListview(
                            favouriteList: provider.favouritesArticles,
                            articles: provider.filteredArticles,
                            onRefresh: () async {
                              provider.fetchArticles();
                            },
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
