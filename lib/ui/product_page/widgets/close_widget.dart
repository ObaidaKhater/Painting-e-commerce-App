import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';

class CustomCircleButtonWidget extends StatelessWidget {
  String iconPath;
  Function onTap;
  Color color;
  EdgeInsets edgeInsets;

  CustomCircleButtonWidget(
      {@required this.iconPath, @required this.onTap, this.edgeInsets, this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          margin:this.edgeInsets??EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
          padding: EdgeInsets.all(10),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme
                .of(context)
                .unselectedWidgetColor
                .withOpacity(0.35),
          ),
          child: Image.asset(
            this.iconPath,
            width: 10,
            height: 10,
            color: this.color ??
                Theme
                    .of(RouteHelper.routeHelper.navKay.currentContext)
                    .focusColor,
          ),
        ),
      ),
    );
  }
}
