import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';
import 'package:gsg_project_1/providers/home_provider.dart';
import 'package:gsg_project_1/ui/constant_values.dart';
import 'package:gsg_project_1/ui/favorite_page/favorite_page.dart';
import 'package:gsg_project_1/ui/widgets/grid_view_products_widget.dart';
import 'package:gsg_project_1/ui/widgets/custom_loading_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, x) {
      return (provider.allCategories == null)
          ? CustomLoadingWidget()
          : DefaultTabController(
              length: provider.allCategories.length,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      appbarText,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        iconNotificationPath,
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                  bottom: TabBar(
                    onTap: (int) => provider.getProductsSpecificCategory(
                      provider.allCategories[int],
                    ),
                    indicatorColor: Theme.of(context).focusColor,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor:
                        Theme.of(context).unselectedWidgetColor,
                    unselectedLabelStyle: Theme.of(context).textTheme.headline3,
                    labelStyle: Theme.of(context).textTheme.headline2,
                    labelColor: Theme.of(context).focusColor,
                    tabs: provider.allCategories
                        .map((category) => Tab(
                              text: category,
                            ))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: provider.allCategories
                      .map(
                        (category) => (category == 'All')
                            ? (provider.allProducts == null)
                                ? CustomLoadingWidget()
                                : GridViewProductsWidget(
                                    products: provider.allProducts)
                            : (provider.productsToSpecificCat == null)
                                ? CustomLoadingWidget()
                                : GridViewProductsWidget(
                                    products: provider.productsToSpecificCat),
                      )
                      .toList(),
                  // children: [
                  //   // Show All Paint
                  //   (provider.allProducts == null)
                  //       ? CustomLoadingWidget()
                  //       : GridViewProductsWidget(products: provider.allProducts),
                  //   (provider.allProducts == null)
                  //       ? CircularProgressIndicator()
                  //       : GridViewProductsWidget(products: provider.allProducts),
                  //   (provider.allProducts == null)
                  //       ? CircularProgressIndicator()
                  //       : GridViewProductsWidget(products: provider.allProducts),
                  //   (provider.allProducts == null)
                  //       ? CircularProgressIndicator()
                  //       : GridViewProductsWidget(products: provider.allProducts),
                  //   (provider.allProducts == null)
                  //       ? CircularProgressIndicator()
                  //       : GridViewProductsWidget(products: provider.allProducts),
                  //   // Show Abstract Art Paint
                  //   // GridViewProductsWidget(
                  //   //     paint: DataPaint.dataPaint.paint
                  //   //         .where((painting) =>
                  //   //             painting.categoriesPainting ==
                  //   //             CategoriesPainting.Abstract)
                  //   //         .toList()),
                  //   //
                  //   // // Show Conceptual Art Paint
                  //   // GridViewProductsWidget(
                  //   //     paint: DataPaint.dataPaint.paint
                  //   //         .where((painting) =>
                  //   //             painting.categoriesPainting ==
                  //   //             CategoriesPainting.Conceptual)
                  //   //         .toList()),
                  //   //
                  //   // // Show Hyperrealism Paint
                  //   // GridViewProductsWidget(
                  //   //   paint: DataPaint.dataPaint.paint
                  //   //       .where((painting) =>
                  //   //           painting.categoriesPainting ==
                  //   //           CategoriesPainting.Hyperrealism)
                  //   //       .toList(),
                  //   // ),
                  // ],
                ),
              ),
            );
    });
  }
}
