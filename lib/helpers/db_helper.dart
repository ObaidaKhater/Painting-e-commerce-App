import 'dart:io';

import 'package:gsg_project_1/model/product_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  final String fileDbName = 'storeDb.db';
  final String cardTable = 'card';
  final String favoriteTable = 'favorite';
  final String productIdColumn = 'id';
  final String productTitleColumn = 'title';
  final String productPriceColumn = 'price';
  final String productDescriptionColumn = 'description';
  final String productCategoryColumn = 'category';
  final String productImageColumn = 'image';
  final String productQuantityColumn = 'quantity';

  Database database;

  initDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$fileDbName';
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''CREATE TABLE $cardTable (
              $productIdColumn INTEGER PRIMARY KEY,
              $productTitleColumn TEXT,
              $productPriceColumn REAL,
              $productDescriptionColumn TEXT,
              $productCategoryColumn TEXT,
              $productImageColumn TEXT,
              $productQuantityColumn INTEGER
               )''');

      db.execute('''CREATE TABLE $favoriteTable (
              $productIdColumn INTEGER PRIMARY KEY,
              $productTitleColumn TEXT,
              $productPriceColumn REAL,
              $productDescriptionColumn TEXT,
              $productCategoryColumn TEXT,
              $productImageColumn TEXT
               )''');
    }, onOpen: (db) {
      print('---> Open database is done.');
    });
    return database;
  }

  Future<List<Map<String, dynamic>>> getCardProducts() async {
    List<Map<String, dynamic>> result = await database.query(cardTable);
    return result;
  }

  insertProductToCard(ProductModel product) async {
    int index = await database.insert(cardTable, product.toDbJson());
    print('---> add product to card is done the index is $index');
  }

  removeProductFromCard(int productId) async {
    int index = await database
        .delete(cardTable, where: '$productIdColumn=?', whereArgs: [productId]);
    print('---> remove product to card is done the index is $index');
  }

  updateProductFromCard(ProductModel product) async {
    int index = await database.update(cardTable, product.toDbJson(),
        where: '$productIdColumn=?', whereArgs: [product.id]);
    print('---> update product to card is done the index is $index');
  }

  removeAllProductsFromCard() async {
    await database.delete(cardTable);
  }

  Future<List<Map<String, dynamic>>> getAllProductsFavorite() async {
    List<Map<String, dynamic>> result = await database.query(favoriteTable);
    return result;
  }

  insertProductToFavorite(ProductModel product) async {
    int index =
        await database.insert(favoriteTable, product.toDbFavoriteJson());
    print('---> add product to favorite is done the index is $index');
  }

  removeProductFromFavorite(int productId) async {
    int index = await database.delete(favoriteTable,
        where: '$productIdColumn=?', whereArgs: [productId]);
    print('---> remove product to favorite is done the index is $index');
  }
}
