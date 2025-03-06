import 'package:dio/dio.dart';

import '../models/products_model.dart';
class ProductsService{
  static Dio dio=Dio();
  static Future<ProductsModel> getProductsDataServides() async{
    Response response= await dio.get("https://student.valuxapps.com/api/products");
    try{
      if (response.statusCode==200){
        print(response.data);
        return ProductsModel.fromJson(response.data);
      }else{
        throw Exception("Code not 200");
      }
    } catch(e){
      throw Exception("Error :$e");

    }
  }
}
