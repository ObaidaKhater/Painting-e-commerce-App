import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';

import 'package:gsg_project_1/model/product_model.dart';
import 'package:gsg_project_1/providers/favorite_provider.dart';
import 'package:gsg_project_1/providers/product_provider.dart';
import 'package:gsg_project_1/ui/constant_values.dart';
import 'package:gsg_project_1/ui/home_page/widgets/box_item_widget.dart';
import 'package:gsg_project_1/ui/product_page/product_page.dart';
import 'package:gsg_project_1/ui/product_page/widgets/close_widget.dart';
import 'package:provider/provider.dart';

class ItemGridViewWidget extends StatelessWidget {
  ProductModel product;

  ItemGridViewWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoriteProvider, ProductProvider>(
        builder: (context, favProvider, productProvider, x) {
      return GestureDetector(
        onTap: () {
          RouteHelper.routeHelper.pushNamed(ProductPage.routeName);
          productProvider.getSpecificProduct(this.product.id);
        },
        child: Container(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child:(favProvider.favoriteProducts == null)?Container(): Container(
                    child: CustomCircleButtonWidget(
                      edgeInsets: EdgeInsets.all(10.0),
                      iconPath: iconLikePath,
                      color: (favProvider.favoriteProducts.any((element) => element.id == product.id))
                          ? Colors.red.shade600
                          : Colors.grey.shade500,
                      onTap: () => favProvider.addToFavorite(product),
                    ),
                  ),
                ),
                Align(
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
                      child: BoxItemWidget(product: this.product),
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                color: Theme.of(context).focusColor.withOpacity(0.1)),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(this.product.image),
            ),
          ),
        ),
      );
    });
  }
}
