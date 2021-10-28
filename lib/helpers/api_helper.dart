import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();

  Future<List<dynamic>> getAllProductsFromApi() async {
    try {
      String url = 'https://fakestoreapi.com/products';
      Response response = await dio.get(url);
      return response.data;
    } catch (e) {
      print('error when get products from api -> ' + e.toString());
      return null;
    }
  }

  Future<List<dynamic>> getAllCategoriesFromApi() async {
    try {
      String url = 'https://fakestoreapi.com/products/categories';
      Response response = await dio.get(url);
      return response.data;
    } catch (e) {
      print('error when get categorise from api -> ' + e.toString());
      return null;
    }
  }

  Future<List<dynamic>> getProductsSpecificCategoryFromApi(String categoryName) async {
    try {
      String url = 'https://fakestoreapi.com/products/category/$categoryName';
      Response response = await dio.get(url);
      return response.data;
    } catch (e) {
      print('error when get products specific category from api -> ' + e.toString());
      return null;
    }
  }


  Future<dynamic> getSpecificProductFromApi(int productId) async {
    try {
      String url = 'https://fakestoreapi.com/products/$productId';
      Response response = await dio.get(url);
      return response.data;
    } catch (e) {
      print('error when get  specific product from api -> ' + e.toString());
      return null;
    }
  }
}
