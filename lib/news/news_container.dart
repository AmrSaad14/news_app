import 'package:flutter/material.dart';
import 'package:news/api_maneger.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/news/news_item.dart';
import 'package:news/theme.dart';

class NewsContainer extends StatelessWidget {
  Source source ;
  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManger.getNews( sourceId: source.id ?? ''),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError){
            print('there is an error');
            return Column(
              children: [
                Text('Some thing  wrong',style: TextStyle(color: MyThemeData.white,fontSize: 14),),
                TextButton(
                    onPressed: (){},
                    child: Text('Try again')),
              ],
            );
          }
          if(snapshot.data?.status == 'OK'){
            return Column(
              children: [
                Text('${snapshot.error}'),
                TextButton(onPressed: (){},
                    child: Text('Try again'))
              ],
            );}
          var newsList = snapshot.data?.articles ?? [];
          print(newsList.length);
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
          );
        }
    );
  }
}
