// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.msg,
    this.products,
  });

  String msg;
  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        msg: json["msg"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.image,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  int id;
  String name;
  String description;
  int quantity;
  String image;
  int categoryId;
  dynamic createdAt;
  dynamic updatedAt;
  Category category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        image: json["image"],
        categoryId: json["category_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "quantity": quantity,
        "image": image,
        "category_id": categoryId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String image;
  dynamic createdAt;
  dynamic updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
