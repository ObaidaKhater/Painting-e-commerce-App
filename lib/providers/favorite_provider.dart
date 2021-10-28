import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/db_helper.dart';
import 'package:gsg_project_1/model/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ProductModel> favoriteProducts;

  FavoriteProvider() {
    getFavoriteProducts();
  }

  getFavoriteProducts() async {
    List<Map<String, dynamic>> result =
        await DbHelper.dbHelper.getAllProductsFavorite();
    favoriteProducts =
        result.map((item) => ProductModel.fromJson(item)).toList();
    notifyListeners();
  }

  addToFavorite(ProductModel product) async {
    bool isInFavorite = favoriteProducts.any((element) => element.id == product.id);
    if (isInFavorite) {
      DbHelper.dbHelper.removeProductFromFavorite(product.id);
    } else {
      DbHelper.dbHelper.insertProductToFavorite(product);
    }
    getFavoriteProducts();
  }
}
