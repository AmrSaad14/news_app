import 'package:flutter/material.dart';
import 'package:news/home/category.dart';
import 'package:news/home/category_item.dart';
import 'package:news/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
  List<Category> categoryList = Category.getCategory();
  Function onCategoryTap ;
  CategoryFragment({required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 15,),
        Text(AppLocalizations.of(context)!.pick,
          style: TextStyle(fontSize: 24,color: MyThemeData.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        Expanded(flex: 3 ,child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 12,mainAxisSpacing: 12),
          itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  onCategoryTap(categoryList[index]);
                },
                child: CategoryItem(category: categoryList[index], index: index));
          },
          itemCount: categoryList.length,
        )
        ),
      ],
    );
  }
}
