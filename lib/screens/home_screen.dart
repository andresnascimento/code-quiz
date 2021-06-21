import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';
import '../widgets/category_list_widget.dart';
import '../widgets/home_title_widget.dart';
import '../models/app_constants.dart';
import '../models/categories_model.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_screen';
  final Category category = Category();
  final categoryList = Category().categoiesList;

  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);
    return Scaffold(
      backgroundColor: kColorBlack,
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          // TODO fix the stack
          HomeScreenTitle(),
          CategoryList(),
        ],
      )),
    );
  }
}
