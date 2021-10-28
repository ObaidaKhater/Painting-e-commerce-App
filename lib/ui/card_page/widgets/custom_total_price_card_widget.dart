import 'package:flutter/material.dart';
import 'package:gsg_project_1/providers/card_provider.dart';
import 'package:provider/provider.dart';

import '../../constant_values.dart';

class CustomTotalPriceCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context,provider,x){
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              totalCardText,
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '\$'+provider.totalPriceCard.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),

          ],
        ),
      );
    });
  }
}
