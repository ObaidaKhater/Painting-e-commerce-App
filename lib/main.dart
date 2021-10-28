import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/db_helper.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';
import 'package:gsg_project_1/providers/card_provider.dart';
import 'package:gsg_project_1/providers/favorite_provider.dart';
import 'package:gsg_project_1/providers/home_provider.dart';
import 'package:gsg_project_1/providers/product_provider.dart';
import 'package:gsg_project_1/ui/favorite_page/favorite_page.dart';

import 'package:gsg_project_1/ui/main_page/main_page.dart';
import 'package:gsg_project_1/ui/product_page/product_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper.dbHelper.initDatabase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
      ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider()),
      ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider()),
      ChangeNotifierProvider<CardProvider>(create: (context) => CardProvider()),
    ],
    child: MaterialApp(
      navigatorKey: RouteHelper.routeHelper.navKay,
      routes: {
        ProductPage.routeName: (context) => ProductPage(),
        FavoritePage.routeName: (context) => FavoritePage(),
      },
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        focusColor: Color(0xFF47292A),
        unselectedWidgetColor: Color(0xFFBCBCBD),
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
          bodyText1: TextStyle(
            color: Color(0xFF47292A),
            fontFamily: "roboto_black",
            fontSize: 25,
          ),
          bodyText2: TextStyle(
            color: Color(0xFF262629),
            fontFamily: "roboto_medium",
            fontSize: 20,
          ),
          subtitle1: TextStyle(
            color: Color(0xFF9D9DA8),
            fontFamily: "roboto_regular",
            fontSize: 17,
          ),
          subtitle2: TextStyle(
            color: Color(0xFF47292A),
            fontFamily: "roboto_medium",
            fontSize: 18,
          ),
        ),
      ),
    ),
  ));
}
