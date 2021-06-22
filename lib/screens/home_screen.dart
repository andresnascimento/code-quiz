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
      body: Container(
        color: Colors.black,
        height: double.infinity,
        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: HomeScreenTitle(),
              // height: 300,
            ),
            Positioned(
              top: 220,
              child: Column(
                // TODO fix the scrooll
                children: [
                  CategoryList(),
                  CategoryList(),
                  CategoryList(),
                  CategoryList(),
                  CategoryList(),
                  CategoryList(),
                  CategoryList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
