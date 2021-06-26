import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/category_list_widget.dart';
import '../widgets/home_title_widget.dart';
import '../models/app_constants.dart';
import '../models/categories_model.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Category category = Category();
  final categoryList = Category().categoiesList;
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double indexValue = controller.offset / 220;
      setState(() {
        topContainer = indexValue;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final questionsData = Provider.of<Questions>(context);
    return Scaffold(
      backgroundColor: kColorBlack,
      body: Container(
        height: size.height,
        child: Stack(
          children: <Widget>[
            HomeScreenTitle(),
            Positioned.fill(
              top: 200,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.2) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0.2) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return AnimatedOpacity(
                          duration: const Duration(milliseconds: 250),
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: CategoryList(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            HomeAppBar(),
          ],
        ),
      ),
    );
  }
}
