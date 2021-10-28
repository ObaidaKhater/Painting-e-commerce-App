import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  int currentIndex;
  int countItems;

  IndicatorWidget({@required this.currentIndex, @required this.countItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            countItems,
            (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: (currentIndex == index)?
                  BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white):BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      shape: BoxShape.circle, color: Colors.transparent),
                )));
  }
}
