class ProductsModel {
  List<dynamic> products;

  ProductsModel({required  this.products});

  factory ProductsModel.fromJson(Map<String,dynamic> json){

    return ProductsModel(products: json["data"]["data"]);
  }
}
