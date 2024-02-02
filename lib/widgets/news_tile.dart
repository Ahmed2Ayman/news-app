import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(articleModel.image??'https://th.bing.com/th?id=OIP.NekoWH22jtLMSNTUnt6mzgHaGM&w=273&h=228&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2'),
          ),
          Text(
            articleModel.title,
            maxLines: 2,
            style: TextStyle(
                fontSize: 22,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold),
          ),
           Text(

      articleModel.subTitle??"",
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
