import 'package:flutter/material.dart';
import 'package:gsg_project_1/model/product_model.dart';
import 'package:gsg_project_1/providers/card_provider.dart';
import 'package:provider/provider.dart';

class CustomCounterQuantityWidget extends StatelessWidget {
  ProductModel product;

  CustomCounterQuantityWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context, provider, x) {
      return Container(
        child: Row(
          children: [
            GestureDetector(
              child: Icon(Icons.arrow_left_sharp),
              onTap: () => provider.decreaseProductQuantityInCard(this.product),
            ),
            SizedBox(width: 5.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
              child: Text(
                this.product.quantity.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
            ),
            SizedBox(width: 5.0),
            GestureDetector(
              child: Icon(Icons.arrow_right_sharp),
              onTap: () => provider.increaseProductQuantityInCard(this.product),
            ),
          ],
        ),
      );
    });
  }
}
