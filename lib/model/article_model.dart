
class ArticleModel {
  int id;
  String title;
  String body;

  ArticleModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
