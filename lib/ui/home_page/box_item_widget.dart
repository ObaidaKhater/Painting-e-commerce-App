import 'package:flutter/material.dart';
import 'package:gsg_project_1/data/data_painters.dart';
import 'package:gsg_project_1/model/painter_model.dart';
import 'package:gsg_project_1/model/painting_model.dart';

class BoxItemWidget extends StatelessWidget {
  Painting painting;

  BoxItemWidget({@required this.painting});

  Painter getPainter() {
    return DataPainter.dataPainter.painters
        .where((painter) => painter.id == painting.painterId)
        .first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              painting.title,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '\$${painting.price.toInt()}',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
        Divider(
          color: Colors.black.withOpacity(0.6),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundImage: ExactAssetImage(getPainter().imagePath),
            ),
            Text(
              '${getPainter().fallName}',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ],
    );
  }
}
