import 'package:flutter/material.dart';
import 'package:news/home/category.dart';
import 'package:news/theme.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index ;

  CategoryItem({required this.category , required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(category.backgroundColor),
          borderRadius: BorderRadius.only(
        topRight:Radius.circular(12),
        topLeft: Radius.circular(12),
        bottomRight: Radius.circular((index %2 == 0)? 0 : 12),
        bottomLeft: Radius.circular((index % 2 == 0)?12:0),
      )),
      child: Column(
        children: [
          Image.asset(category.imagePath,height: 120,fit: BoxFit.fill,),
          SizedBox(height: 20,),
          Text(category.name,textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22 ,color: MyThemeData.white,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
