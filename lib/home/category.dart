import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/providers/provider.dart';


class Category {
  String id;
  String imagePath ;
  int backgroundColor ;
  String name;
  Category({required this.id , required this.name , required this.backgroundColor , required this.imagePath});
  
  static List <Category> getCategory (){
    return[
      Category(id: 'sports', name: "Sports", backgroundColor: 0xFFC91C22 , imagePath: 'assets/images/sports.png'),
      Category(id: 'business', name: 'Business', backgroundColor: 0xFFCF7E48, imagePath: 'assets/images/bussines.png'),
      Category(id: 'entertainment', name: 'Entertainment', backgroundColor: 0xFF303030, imagePath: 'assets/images/environment.png'),
      Category(id: 'health', name: 'Health', backgroundColor: 0xFFED1E79, imagePath: 'assets/images/health.png'),
      Category(id: 'technology', name: 'Technology', backgroundColor: 0xFF003E90, imagePath: 'assets/images/Politics.png'),
      Category(id: 'science', name: 'Science', backgroundColor: 0xFFF2D352, imagePath: 'assets/images/science.png'),
    ];
  }
}