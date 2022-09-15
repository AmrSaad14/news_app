
import 'package:flutter/material.dart';
import 'package:news/providers/provider.dart';
import 'package:news/theme.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) )
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');

            },
            child: provider.language == 'en'?
            getSelectedItem('English'):getUnSelectedItem('English'),
          ),
          SizedBox(height:20 ,),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child:  provider.language == 'ar'?
            getSelectedItem('عربي'): getUnSelectedItem("عربي"),

          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(
            fontSize: 18,color: MyThemeData.black
        ),),Icon(Icons.check,color: MyThemeData.primaryColor,),
      ],
    );
  }
  Widget getUnSelectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(
            fontSize: 18,color: MyThemeData.black
        ),),
      ],
    );
  }
}
