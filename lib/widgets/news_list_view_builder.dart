import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
   const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  future=  NewsService(Dio()).getTopHeadLines(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context,snapshot){

      if (snapshot.hasData) {
        return NewsListView(articles: snapshot.data!);
      } else if(snapshot.hasError) {
        return SliverToBoxAdapter(
            child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                child: const Center(child: Text('oop there is an error'))));
      }
      else{
        return SliverToBoxAdapter(
            child: SizedBox(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2,
                child: const Center(child: CircularProgressIndicator())));
      }
        }

    );
    // return isLoading
    //     ?  SliverToBoxAdapter(
    //         child: Container(
    //             width: MediaQuery.of(context).size.width/2,
    //             height: MediaQuery.of(context).size.height/2,
    //             child: Center(child: CircularProgressIndicator())))
    //     : NewsListView(articles: articles);
  }
}
