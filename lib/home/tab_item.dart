import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TabItem extends StatelessWidget {
Source source ;
bool isSelected ;
TabItem ({required this.source,required this .isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: isSelected ? MyThemeData.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: MyThemeData.primaryColor)
      ),
      child: Text(source.name ?? '' ,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isSelected? MyThemeData.white : MyThemeData.primaryColor,
      ),)
    );
  }
}
