import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gsg_project_1/model/product_model.dart';
import 'package:gsg_project_1/ui/widgets/item_gridview_widget.dart';

class GridViewProductsWidget extends StatelessWidget {
  List<ProductModel> products;

  GridViewProductsWidget({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 5),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) => ItemGridViewWidget(product: products[index]),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index == 0 ? 2.7 : 3.7),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
