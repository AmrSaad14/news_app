import 'package:flutter/material.dart';
import 'package:news/details/details_screen.dart';
import 'package:news/home/category_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/providers/provider.dart';
import 'package:news/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context)=> AppProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(

      title: 'News',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        NewsDetailsScreen.routeName : (context) => NewsDetailsScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
          primaryColor: MyThemeData.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MyThemeData.primaryColor
        )

      ),
      locale: Locale(provider.language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
