import 'package:flutter/material.dart';
import 'package:gsg_project_1/data/data_painters.dart';
import 'package:gsg_project_1/model/painting_model.dart';
import 'package:gsg_project_1/ui/painting_page/button_widget.dart';

class BoxDescriptionWidget extends StatelessWidget {
  Painting painting;

  BoxDescriptionWidget({@required this.painting});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.33,
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                painting.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '\$${painting.price.toInt()}',
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          Divider(color: Color(0xFFA8A8A8).withOpacity(0.2), height: 10),
          SizedBox(height: 10),
          Column(
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: ExactAssetImage(DataPainter
                      .dataPainter.painters
                      .where((painter) => painter.id == painting.painterId)
                      .first
                      .imagePath),
                ),
                SizedBox(width: 15),
                Text(
                  '${DataPainter.dataPainter.painters.where((painter) => painter.id == painting.painterId).first.fallName}',
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ]),
              SizedBox(height: 15),
              Text(painting.description,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          SizedBox(height: 20),
          ButtonWidget(),
        ],
      ),
    );
  }
}
