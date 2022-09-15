import 'package:flutter/material.dart';
import 'package:news/api_maneger.dart';
import 'package:news/home/category.dart';
import 'package:news/home/tab_container.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/theme.dart';

class CategoryDetails extends StatelessWidget {
  static String routeName = 'category_details' ;
  Category category;
  CategoryDetails({required this.category});

  @override
  Widget build(BuildContext context) {

    return
      FutureBuilder<SourceResponse>(
        future: ApiManger.getSource(category.id),
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
                    onPressed: (){
                },
                    child: Text('Try again')),
              ],
            );
          }
          if(snapshot.data?.status == 'OK'){
            return Column(
              children: [
                Text('Some thing went wrong'),
                TextButton(onPressed: (){

                }, child: Text('Try again'))
              ],
            );}
          var sourceList = snapshot.data?.sources ?? [];
          print(sourceList.length);
          return TabContainer(sources: sourceList);
        }
        );
  }
}