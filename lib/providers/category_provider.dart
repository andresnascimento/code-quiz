import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/category_list_widget.dart';
import '../models/app_constants.dart';

class Category with ChangeNotifier {
  List<CategoryModel>? _categoryModel = [
    CategoryModel(
      categoryName: 'HTML',
      score: 20,
    ),
  ];

  List<CategoryModel>? get categoryModel {
    return _categoryModel;
  }

  bool played(String categoryName) {
    if (_categoryModel!.contains(categoryName)) {
      return true;
    } else {
      return false;
    }
  }

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

String quizToJson(List<CategoryModel> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class CategoryModel {
  CategoryModel({
    this.id = '1',
    @required this.categoryName,
    this.score = 0,
    this.lastPlayed = 'today',
  });

  String? id = DateTime.now().toString();
  String? categoryName;
  int? score;
  String? lastPlayed;

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "score": score,
        "lastPlayed": lastPlayed
      };
}
