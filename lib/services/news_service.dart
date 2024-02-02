import 'package:dio/dio.dart';
import 'package:newsapp/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  Future<List<ArticleModel>> getTopHeadLines({required String category}) async {

    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=eb1d0362b40245c7a41fbeb137969b03&category=$category');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];

    List<ArticleModel> articleList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(article);
      articleList.add(articleModel);
    }
    return articleList;
  }
}
