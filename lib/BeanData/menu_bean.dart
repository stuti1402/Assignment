import 'dart:convert';
import 'dart:core';

class MenuBean{
  String? category;
  List<Product>? products;

  MenuBean.name(this.category, this.products);

  static MenuBean fromJson(String key,List products){
    return MenuBean.name(key, products.map((e) => Product.fromJson(e)).toList());
  }
}

class Product{
  String? name;
  int? price;
  bool? inStock;
  int count=0;
  bool isBestSeller=false;



  Product.name(this.name, this.price, this.inStock,this.count);

  static Product fromJson(Map<String,dynamic> json){
    return Product.name(
        json["name"],
        json["price"],
        json["instock"],
        json["count"]??0,
    );
  }

  Map<String,dynamic>  toJson(){
    return {
      "name":name,
      "price":price,
      "instock":inStock,
      "count":count,

    };
  }
}