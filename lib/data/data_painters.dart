import 'package:gsg_project_1/model/painter_model.dart';


class DataPainter {
  List<Painter> painters = [
    Painter(
        id: '101',
        fallName: 'Farbod M Mehr',
        imagePath: 'assets/images/farbod_m_mehr.jpg')
  ];

  DataPainter._();

  static DataPainter dataPainter = DataPainter._();
}
