import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManger{
  static const String baseUrl ='newsapi.org' ;
  /*
  https:///v2/top-headlines/sources?apiKey=b23cf3467be84e8193a9fafa669fc7f8
   */
  static Future<SourceResponse> getSource(String categoryId)async{
    var url = Uri.https(baseUrl , '/v2/top-headlines/sources',
    {
      'apiKey' : 'b23cf3467be84e8193a9fafa669fc7f8',
      'category' : categoryId
    }
    );
    try{
      var response = await http.get(url);
      String bodyString = response.body ;
      var json = jsonDecode(bodyString);
      var sourceResponse = SourceResponse.fromJson(json);
      return sourceResponse ;
    }catch(e){throw e ;}

  }
  
  static Future<NewsResponse>getNews ({String? sourceId , String? searchKeyword})async{
    var url = Uri.https(baseUrl , '/v2/everything',{
    'apiKey' : 'b23cf3467be84e8193a9fafa669fc7f8',
    'sources': sourceId,
      'q' : searchKeyword ,
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse ;
    }catch(e){
      throw e ;
    }
  }
}