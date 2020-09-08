// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.msg,
    this.categories,
  });

  String msg;
  List<Category> categories;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        msg: json["msg"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
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
