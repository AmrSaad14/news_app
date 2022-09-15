import 'package:flutter/material.dart';
import 'package:news/details/details_screen.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/theme.dart';

class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  
  @override
  Widget build(BuildContext context) {
    String time = DateTime.parse(news.publishedAt ?? '').hour.toString() ;
    return InkWell(
      onTap: ()=> Navigator.of(context).pushNamed(NewsDetailsScreen.routeName,arguments: news),

      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
                child: Image.network(news.urlToImage ??
                'https://play-lh.googleusercontent.com/blO52aLoIwSmO6mYe7cL2ZxV6zhPDC7--AdpcSkVrpPaeZJouPrbaD6Iz51VNdmu9Vc')),
            SizedBox(height: 8,),
            Text(news.author ?? '',style: TextStyle(
              color: MyThemeData.grey , fontSize: 14,
            ),),
            Text(news.title ?? '',style: TextStyle(color: MyThemeData.black,fontSize: 18,fontWeight: FontWeight.bold),),
            Text( time ,style: TextStyle(
              color: MyThemeData.grey , fontSize: 14,
            ),textAlign: TextAlign.end,),

          ],
        ),
      ),
    );
  
  }
}
