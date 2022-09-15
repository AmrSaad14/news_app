import 'package:flutter/material.dart';
import 'package:news/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int CATEGORIES =1 ;
  static const int SETTINGS = 2 ;
  Function onSideItemMenu ;
  HomeDrawer({required this.onSideItemMenu});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: MyThemeData.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 70),
            width: double.infinity,
            child: Center(
              child: Text(AppLocalizations.of(context)!.elmogz,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: MyThemeData.white),
                textAlign: TextAlign.center,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: (){
              onSideItemMenu(HomeDrawer.CATEGORIES);
            },
              child: Row(
                children: [
                  Icon(Icons.list),
                  Text(AppLocalizations.of(context)!.catgs,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: MyThemeData.black),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: (){
              onSideItemMenu(HomeDrawer.SETTINGS);
            },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Text(AppLocalizations.of(context)!.setting,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,color: MyThemeData.black),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
