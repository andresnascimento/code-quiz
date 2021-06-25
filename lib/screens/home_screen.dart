import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';
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
      double indexValue = controller.offset / 130;
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
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: size.width,
                  height: closeTopContainer ? 0 : size.height * 0.30,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
                      decoration: BoxDecoration(
                        color: kColorPrimary,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Let\'s play!',
                            style: GoogleFonts.quicksand(textStyle: kHeaderLg),
                          ),
                          Text(
                            'Choose a category to start playing',
                            style: GoogleFonts.mulish(
                              textStyle: kTextBody.copyWith(
                                color: Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    if (topContainer > 0.5) {
                      scale = index + 0.5 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }

                    return Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale, scale),
                        alignment: Alignment.bottomCenter,
                        child: CategoryList(),
                      ),
                    );
                  },
                  // children: <Widget>[
                  //   Transform(
                  //       transform: Matrix4.identity()..scale(1),
                  //       child: CategoryList()),
                  //   CategoryList(),
                  //   CategoryList(),
                  //   CategoryList(),
                  //   CategoryList()
                  // ],
                ),
              )
            ],
          ),
        ));
  }
}

// SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           color: Colors.black,
//           child: Stack(
//             // fit: StackFit.expand,
//             children: <Widget>[
//               Positioned(
//                 child: HomeScreenTitle(),
//                 // height: 300,
//               ),
//               Positioned(
//                 top: 220.0,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   // TODO fix the scrooll
//                   children: <Widget>[
//                     CategoryList(),
//                     CategoryList(),
//                     CategoryList(),
//                     CategoryList(),
//                     CategoryList(),
//                     CategoryList(),
//                     CategoryList(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
