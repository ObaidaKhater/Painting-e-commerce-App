import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/db_helper.dart';
import 'package:gsg_project_1/model/product_model.dart';

class CardProvider extends ChangeNotifier {
  List<ProductModel> cardProducts;
  double totalPriceCard = 0;

  CardProvider() {
    getCardProducts();
  }

  getCardProducts() async {
    List<Map<String, dynamic>> result =
        await DbHelper.dbHelper.getCardProducts();
    cardProducts = result.map((item) => ProductModel.fromJson(item)).toList();
    getTotalPriceCard();
    notifyListeners();
  }

  addProductToCard(ProductModel product) async {
    bool isProductInCard =
        cardProducts.any((element) => element.id == product.id);
    if (isProductInCard) {
      product.quantity = cardProducts
          .where((element) => element.id == product.id)
          .first
          .quantity;
      increaseProductQuantityInCard(product);
    } else {
      DbHelper.dbHelper.insertProductToCard(product);
    }
    getCardProducts();
  }

  increaseProductQuantityInCard(ProductModel product) {
    product.quantity++;
    DbHelper.dbHelper.updateProductFromCard(product);
    getCardProducts();
  }

  decreaseProductQuantityInCard(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      DbHelper.dbHelper.updateProductFromCard(product);
      getCardProducts();
    }
  }

  checkoutCard() {
    DbHelper.dbHelper.removeAllProductsFromCard();
    getCardProducts();
  }

  removeProductFromCard(int productId) {
    DbHelper.dbHelper.removeProductFromCard(productId);
    getCardProducts();
  }

  getTotalPriceCard() {
    totalPriceCard = 0;
    for (ProductModel product in cardProducts) {
      totalPriceCard += (product.price * product.quantity);
    }
  }
}
