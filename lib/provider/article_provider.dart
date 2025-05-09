import 'package:bharat_nxt_assignment/model/article_model.dart';
import 'package:bharat_nxt_assignment/service/api_service.dart';
import 'package:bharat_nxt_assignment/service/local_storage_service.dart';
import 'package:flutter/material.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleProvider() {
    fetchArticles();
  }

  final localStorageService = LocalStorageService();
  final searchController = TextEditingController();
  List<ArticleModel> articles = [];
  List<ArticleModel> filteredArticles = [];
  List<ArticleModel> favouritesArticles = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void fetchArticles() async {
    ApiService apiService = ApiService();
    articles = await apiService.fetchArtciles();
    filteredArticles = articles;
    await loadFavourites();
    _isLoading = false;
    notifyListeners();
  }

  void clearController() {
    searchController.clear();
    filteredArticles = articles;
    notifyListeners();
  }

  Future<void> loadFavourites() async {
    List<String> favIds = await localStorageService.getIds();
    if (favIds.isNotEmpty) {
      favouritesArticles = articles
          .where((article) => favIds.contains(article.id.toString()))
          .toList();
    }
  }

  Future<void> saveFavouritesToLocal() async {
    List<String> favIds =
        favouritesArticles.map((article) => article.id.toString()).toList();
    await localStorageService.saveIds(favIds);
  }

  void addFavourite(ArticleModel article) {
    if (!favouritesArticles.contains(article)) {
      favouritesArticles.add(article);
      saveFavouritesToLocal();
      notifyListeners();
    }
  }

  void removeFavourite(ArticleModel article) {
    favouritesArticles.removeWhere((item) => item.id == article.id);
    saveFavouritesToLocal();
    notifyListeners();
  }

  void likeButtonFn(ArticleModel article) {
    if (isFavourite(article)) {
      removeFavourite(article);
    } else {
      addFavourite(article);
    }
  }

  bool isFavourite(ArticleModel article) {
    return favouritesArticles.any((item) => item.id == article.id);
  }

  void filterArticles(String value) {
    if (value.isEmpty) {
      filteredArticles = articles;
    } else {
      filteredArticles = articles.where((article) {
        return article.title.toLowerCase().contains(value.toLowerCase()) ||
            article.body.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
