import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../services/product_service.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsModel? productsModel;

  Future<void> getProductsDataProvider() async {
    productsModel = await ProductsService.getProductsDataServides();
    notifyListeners();
  }
}
