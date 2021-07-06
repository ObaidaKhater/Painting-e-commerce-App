import 'package:flutter/material.dart';
import 'package:gsg_project_1/ui/main_page/main_page.dart';
import 'package:gsg_project_1/ui/painting_page/painting_page.dart';

import 'model/painting_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaintingPage(painting: Painting(
        title: 'Inner calm',
        description:
        'Inner calm - 80*80 Cm , 1/10 , Limited Print on Epson Fine art paper',
        price: 2100,
        painterId: '101',
        categoriesPainting: CategoriesPainting.Abstract,
        imagesPath: [
          'assets/images/painting11.png',
          'assets/images/painting12.png',
          'assets/images/painting11.png',
        ],
      ),),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xFF2E2842),
            fontFamily: "roboto_black",
            fontSize: 20,
          ),
          headline2: TextStyle(
            color: Color(0xFF47292A),
            fontFamily: "roboto_black",
            fontSize: 14,
          ),
          headline3: TextStyle(
            color: Color(0xFFBCBCBD),
            fontFamily: "roboto_regular",
            fontSize: 14,
          ),
          headline4: TextStyle(
            color: Color(0xFF000000),
            fontFamily: "roboto_regular",
            fontSize: 13,
          ),
          headline5: TextStyle(
            color: Color(0xFF000000),
            fontFamily: "roboto_black",
            fontSize: 14,
          ),
          headline6: TextStyle(
            color: Color(0xFF262629),
            fontFamily: "roboto_black",
            fontSize: 20,
          ),
          bodyText1:  TextStyle(
            color: Color(0xFF47292A),
            fontFamily: "roboto_black",
            fontSize: 25,
          ),
          bodyText2:  TextStyle(
            color: Color(0xFF262629),
            fontFamily: "roboto_medium",
            fontSize: 20,
          ),
          subtitle1:  TextStyle(
            color: Color(0xFF9D9DA8),
            fontFamily: "roboto_regular",
            fontSize: 17,
          ),
          subtitle2:  TextStyle(
            color: Color(0xFF47292A),
            fontFamily: "roboto_medium",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
