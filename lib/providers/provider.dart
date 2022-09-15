import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String language = 'en';
  String newsLanguage= 'en';

  void changeLanguage(String newLanguage){
    if (language == newLanguage){return;}
    language = newLanguage ;
    notifyListeners();
  }

  bool isEnglish (){
    if(newsLanguage == 'en'){
      return true;
    }else{
      return false;
    }
  }
}
