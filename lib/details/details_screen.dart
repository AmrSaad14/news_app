import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routeName = 'news_details_screen';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
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
            Text(news.publishedAt ?? '',style: TextStyle(
              color: MyThemeData.grey , fontSize: 14,
            ),textAlign: TextAlign.end,),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Text(news.content??'',style: TextStyle(color: Colors.black,fontSize: 13),),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            TextButton(onPressed: (){openUrl(news.url);}, child:Row(mainAxisAlignment: MainAxisAlignment.end ,
              children: [
              Text('View Full Article',style: TextStyle(color: Colors.black),),
              Icon(Icons.play_arrow,color: Colors.black,size: 20,),
            ],))

          ],
        ),
      ),
    );
  }
  void openUrl(String? url)async{
    if(url == null){
      return;
    }
    var uri = Uri.parse(url);
    if ( !await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else {
      print('false');
    }
  }
}
