import 'package:flutter/material.dart';
import 'package:gsg_project_1/helpers/api_helper.dart';
import 'package:gsg_project_1/model/product_model.dart';

class HomeProvider extends ChangeNotifier {
  List<ProductModel> allProducts;
  List<String> allCategories;
  List<ProductModel> productsToSpecificCat;

  HomeProvider() {
    getAllProducts();
    getAllCategories();
  }

  getAllProducts() async {
    List<dynamic> result = await ApiHelper.apiHelper.getAllProductsFromApi();
    allProducts = result.map((item) => ProductModel.fromJson(item)).toList();
    notifyListeners();
  }

  getAllCategories() async {
    List<dynamic> result = await ApiHelper.apiHelper.getAllCategoriesFromApi();
    allCategories = result.map((item) => item.toString()).toList();
    allCategories.insert(0, 'All');
    notifyListeners();
  }

  getProductsSpecificCategory(String categoryName) async {
    productsToSpecificCat = null;
    notifyListeners();
    List<dynamic> result = await ApiHelper.apiHelper.getProductsSpecificCategoryFromApi(categoryName);
    productsToSpecificCat = result.map((item) => ProductModel.fromJson(item)).toList();
    notifyListeners();
  }


}
