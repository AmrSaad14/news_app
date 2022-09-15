import 'package:flutter/material.dart';
import 'package:news/api_maneger.dart';
import 'package:news/home/category.dart';
import 'package:news/home/category_details.dart';
import 'package:news/home/category_fragment.dart';
import 'package:news/home/category_item.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/news/news_item.dart';
import 'package:news/settings/setting.dart';
import 'package:news/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(fit: BoxFit.fitHeight,
            image: AssetImage('assets/images/backGround.png'))
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.elmogz),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){showSearch(context: context, delegate: Search());},
                icon: Icon(Icons.search,size: 35,))
          ],
        ),
        drawer: HomeDrawer(onSideItemMenu: onSideItemMenu),
        body: selectedItemDrawer == HomeDrawer.SETTINGS?
            Settings()
        :
        selectedCategory == null ?
        CategoryFragment(onCategoryTap: onCategoryTap):
        CategoryDetails(category: selectedCategory!),

      ),
    );
  }

  Category? selectedCategory = null ;

  void onCategoryTap(Category category){
    selectedCategory = category ;
    setState(() {

    });
  }
  var selectedItemDrawer = HomeDrawer.CATEGORIES ;
  void onSideItemMenu(int selectedItem){
    selectedItemDrawer = selectedItem ;
    Navigator.pop(context);
    selectedCategory = null ;
    setState(() {

    });
  }
}

class Search extends SearchDelegate {
  late Future<NewsResponse>futureOfNews ;
  Search(){
    futureOfNews = ApiManger.getNews( searchKeyword: '');
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){showResults(context);},
          icon: Icon(Icons.search,size: 35,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return     IconButton(onPressed: (){Navigator.pop(context);},
        icon: Icon(Icons.clear,size: 35,));
  }

  @override
  Widget buildResults(BuildContext context) {

    return  Container(
      color: Colors.white,
      child: FutureBuilder<NewsResponse>(
          future: ApiManger.getNews( searchKeyword: query),
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
                      onPressed: (){},
                      child: Text('Try again')),
                ],
              );
            }
            if(snapshot.data?.status == 'OK'){
              return Column(
                children: [
                  Text('${snapshot.error}'),
                  TextButton(onPressed: (){},
                      child: Text('Try again'))
                ],
              );}
            var newsList = snapshot.data?.articles ?? [];
            print(newsList.length);
            return ListView.builder(itemBuilder: (context,index){
              return NewsItem(news: newsList[index]);
            },
              itemCount: newsList.length,
            );
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(color:Colors.white , child: Center(child: Text('Seggestions',
      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)));
  }

}