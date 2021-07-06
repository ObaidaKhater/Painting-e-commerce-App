import 'package:gsg_project_1/model/painting_model.dart';

class DataPaint {
  List<Painting> paint = [
    Painting(
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
    ),
    Painting(
      title: 'Inner calm',
      description:
          'Inner calm - 80*80 Cm , 1/10 , Limited Print on Epson Fine art paper',
      price: 2500,
      painterId: '101',
      categoriesPainting: CategoriesPainting.Conceptual,
      imagesPath: [
        'assets/images/painting21.png',
      ],
    ),
    Painting(
      title: 'Inner calm',
      description:
          'Inner calm - 80*80 Cm , 1/10 , Limited Print on Epson Fine art paper',
      price: 900,
      painterId: '101',
      categoriesPainting: CategoriesPainting.Hyperrealism,
      imagesPath: [
        'assets/images/painting31.png',
      ],
    ),
    Painting(
      title: 'Inner calm',
      description:
          'Inner calm - 80*80 Cm , 1/10 , Limited Print on Epson Fine art paper',
      price: 2100,
      painterId: '101',
      categoriesPainting: CategoriesPainting.Abstract,
      imagesPath: [
        'assets/images/painting41.png',
      ],
    ),
    Painting(
      title: 'Inner calm',
      description:
          'Inner calm - 80*80 Cm , 1/10 , Limited Print on Epson Fine art paper',
      price: 2100,
      painterId: '101',
      categoriesPainting: CategoriesPainting.Conceptual,
      imagesPath: [
        'assets/images/painting11.png',
        'assets/images/painting12.png',
        'assets/images/painting11.png',
      ],
    ),
    Painting(
      title: 'Inner calm',
      description:
          'Inner calm - 80*80 Cm , 1/10 , Limited Print on Epson Fine art paper',
      price: 2100,
      painterId: '101',
      categoriesPainting: CategoriesPainting.Hyperrealism,
      imagesPath: [
        'assets/images/painting11.png',
        'assets/images/painting12.png',
        'assets/images/painting11.png',
      ],
    ),
  ];

  DataPaint._();

  static DataPaint dataPaint = DataPaint._();
}
