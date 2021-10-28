import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';
import 'package:gsg_project_1/providers/favorite_provider.dart';
import 'package:gsg_project_1/ui/widgets/grid_view_products_widget.dart';
import 'package:gsg_project_1/ui/widgets/custom_loading_widget.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  static final String routeName = 'favorite';

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Favorite',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: (provider.favoriteProducts == null)
            ? CustomLoadingWidget()
            : GridViewProductsWidget(
                products: provider.favoriteProducts,
              ),
      );
    });
  }
}
