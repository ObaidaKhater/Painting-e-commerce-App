import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';
import 'package:gsg_project_1/model/product_model.dart';
import 'package:gsg_project_1/providers/card_provider.dart';
import 'package:gsg_project_1/providers/product_provider.dart';
import 'package:gsg_project_1/ui/card_page/widgets/custom_counter_quantity_widget.dart';
import 'package:gsg_project_1/ui/product_page/product_page.dart';
import 'package:provider/provider.dart';

class CustomItemCardWidget extends StatelessWidget {
  ProductModel product;

  CustomItemCardWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context, provider, x) {
      return GestureDetector(
        onTap: () {
          Provider.of<ProductProvider>(context,listen: false).getSpecificProduct(product.id);
          RouteHelper.routeHelper.pushNamed(ProductPage.routeName);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 18.0),
          child: ListTile(
            title: Text(
              this.product.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            leading: CachedNetworkImage(
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width / 4,
              imageUrl: this.product.image,
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle_rounded,
                color: Theme.of(context).focusColor,
              ),
              onTap: () => provider.removeProductFromCard(product.id),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.product.description,
                  style: Theme.of(context).textTheme.headline3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 7.0),
                Row(
                  children: [
                    Text(
                      '\$' + this.product.price.toString(),
                      style: Theme.of(context).textTheme.headline5,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    CustomCounterQuantityWidget(product: this.product),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
