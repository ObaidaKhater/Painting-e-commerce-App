import 'package:flutter/material.dart';
import 'package:gsg_project_1/model/painting_model.dart';
import 'package:gsg_project_1/ui/home_page/box_item_widget.dart';

class ItemGridViewWidget extends StatelessWidget {
  Painting painting;

  ItemGridViewWidget({@required this.painting});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 80,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: BoxItemWidget(painting: painting),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            painting.imagesPath[0],
          ),
        ),
      ),
    );
  }
}
