import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/api_helper.dart';
import 'package:gsg_project_1/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel product;

  getSpecificProduct(int productId) async {
    product = null;
    dynamic result = await ApiHelper.apiHelper.getSpecificProductFromApi(productId);
    product = ProductModel.fromJson(result);
    notifyListeners();
  }
}
