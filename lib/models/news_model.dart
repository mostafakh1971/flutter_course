class NewsModel {
  String? status;
  int? totalResults;
  List<Article> articles = [];
  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    json["articles"].forEach((element) {
      articles.add(Article.fromJson(element));
    });
  }
}

class Article {
  String? title;
  String? author;
  String? url;
  String? image;
  String? content;

  Article.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    author = json["author"];
    url = json["url"];
    image = json["urlToImage"];
    content = json["content"];
  }
}
