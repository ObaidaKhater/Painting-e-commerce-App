import 'package:flutter/material.dart';
import 'package:gsg_project_1/model/product_model.dart';
import 'package:gsg_project_1/ui/constant_values.dart';

class BoxItemWidget extends StatelessWidget {
  ProductModel product;

  BoxItemWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline4,
                  maxLines: 1,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '\$${product.price.toInt()}',
                  style: Theme.of(context).textTheme.headline5,
                ),
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
                backgroundImage: AssetImage(
                  userImage,
                ),
              ),
              Text(
                userName,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
