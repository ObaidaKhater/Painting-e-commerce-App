import 'package:flutter/material.dart';

enum CategoriesPainting { Abstract, Conceptual, Hyperrealism }

class Painting {
  String title;
  String description;
  double price;
  String painterId;
  CategoriesPainting categoriesPainting;
  List<String> imagesPath;

  Painting({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.painterId,
    @required this.categoriesPainting,
    @required this.imagesPath,
  });
}
