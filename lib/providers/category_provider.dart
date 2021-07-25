import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/category_list_widget.dart';
import '../models/app_constants.dart';

class Category with ChangeNotifier {
  List<CategoryCard> _categoryCardList = [
    CategoryCard(
      categoryColor: kColorOrange,
      gradientLight: kColorOrange,
      gradientDark: kColorOrangeDark,
      categoryShadow: kColorOrangeDarker.withOpacity(0.5),
      categoryName: 'HTML',
      imageName: 'html',
    ),
    CategoryCard(
      categoryColor: kColorYellow,
      gradientLight: kColorYellow,
      gradientDark: kColorYellowDark,
      categoryShadow: kColorYellowDarker.withOpacity(0.4),
      fontColor: kColorBlack,
      categoryName: 'JavaScript',
      imageName: 'javascript',
    ),
  ];

  List<CategoryCard> get categoryCardList {
    return [..._categoryCardList];
  }

  //TODO add the update function to update the score and lastplayed data

  //TODO evaluate the possibilite to move the saveCatgoryScore() function to this provider

  //TODO when creates an acc, add a list of categories to the database
  // void firstUpdate() async {}
}

// class CategoryModel {
//   CategoryModel({
//     this.id,
//     @required this.categoryName,
//     this.score = 0,
//     this.lastPlayed,
//   });

//   String? id = DateTime.now().toString();
//   String? categoryName;
//   int? score;
//   String? lastPlayed;
// }
