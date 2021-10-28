import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/route_helper.dart';
import 'package:gsg_project_1/providers/favorite_provider.dart';
import 'package:gsg_project_1/providers/product_provider.dart';
import 'package:gsg_project_1/ui/constant_values.dart';
import 'package:gsg_project_1/ui/product_page/widgets/box_description_widget.dart';
import 'package:gsg_project_1/ui/product_page/widgets/close_widget.dart';
import 'package:gsg_project_1/ui/product_page/widgets/indicator_widget.dart';
import 'package:gsg_project_1/ui/widgets/custom_loading_widget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  static final String routeName = 'product';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // _currentIndex = widget.painting.imagesPath.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, FavoriteProvider>(
        builder: (context, productProvider, favProvider, x) {
      return Scaffold(
        body: (productProvider.product == null)
            ? CustomLoadingWidget()
            : Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: PageView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                                imageUrl: productProvider.product.image,
                                fit: BoxFit.contain);
                          },
                          onPageChanged: (newIndex) {
                            _currentIndex = newIndex;
                            setState(() {});
                          },
                          controller: PageController(
                            initialPage: 0,
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.36,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IndicatorWidget(
                            currentIndex: _currentIndex,
                            countItems: 1,
                          ),
                          BoxDescriptionWidget(),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCircleButtonWidget(
                        iconPath: iconLikePath,
                        color: (favProvider.favoriteProducts
                                .any((element) => element.id == productProvider.product.id))
                            ? Colors.red.shade600
                            : Colors.grey.shade500,
                        onTap: () => favProvider.addToFavorite(productProvider.product),
                      ),
                      CustomCircleButtonWidget(
                        iconPath: iconClosePath,
                        onTap: () => RouteHelper.routeHelper.back(),
                      ),
                    ],
                  ),
                ],
              ),
      );
    });
  }
}
