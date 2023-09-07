import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key, required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            height: 250,
            child: Image(
              image: NetworkImage(article.urlToImage==null?"https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/624px-No-Image-Placeholder.svg.png":article.urlToImage.toString()),
            ),
          ),
          Text(article.title.toString(),style: TextStyle(fontSize: 28),),
          Text(article.description.toString(),style: TextStyle(fontSize: 18),),
          //Text(article.content.toString(),style: TextStyle(fontSize: 18),),
        ],
      ),

    );
  }
}
