import 'package:flutter/material.dart';
import 'package:news/providers/provider.dart';
import 'package:news/settings/language_sheet.dart';
import 'package:news/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
          Text(AppLocalizations.of(context)!.lang,style: TextStyle(fontSize: 22,color: MyThemeData.primaryColor),),
    SizedBox(height: 20,),
    InkWell(
    onTap: (){
    showLanguageBottomSheet();
    },
    child: Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
    color: MyThemeData.primaryColor,
    borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(provider.language=='en'?'English' : 'عربي',
      style: TextStyle(fontSize: 18,color: MyThemeData.white),),
    Icon(Icons.keyboard_arrow_down_rounded,size: 40,),
    ],
    ),
    ),
    ),

    SizedBox(height: 15,),
    //   Container(
    //   margin: EdgeInsets.all(18),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //
    //     children: [
    //       Text(AppLocalizations.of(context)!.lang,
    //         style: TextStyle(color: MyThemeData.primaryColor, fontSize: 22),),
    //
    //       SizedBox(height: 20,),
    //
    //       InkWell(
    //         onTap: () {
    //           showLanguageBottomSheet();
    //
    //           print('language bottom sheet');
    //         },
    //         child: Container(
    //           padding: EdgeInsets.all(15),
    //           decoration: BoxDecoration(
    //               color: MyThemeData.primaryColor,
    //               borderRadius: BorderRadius.circular(20)
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 provider.changeLanguage == 'ar' ? 'عربي' : "English",
    //                 style: TextStyle(color: MyThemeData.white, fontSize: 20),),
    //               Icon(Icons.keyboard_arrow_down_rounded, size: 40,),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    ]
    )
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        }
    );
  }
}

