import '../widgets/category_list_widget.dart';
import 'app_constants.dart';
import 'package:flutter/material.dart';

class Category {
  List<CategoryCard> _categoryList = [
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

  List<CategoryCard> get categoryList {
    return [..._categoryList];
  }
}
