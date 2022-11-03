// To parse this JSON data, do
//
//     final shoeModel = shoeModelFromMap(jsonString);

import 'dart:convert';

class ShoeModel {
  ShoeModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
  });

  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  final int quantity;

  factory ShoeModel.fromJson(String str) => ShoeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoeModel.fromMap(Map<String, dynamic> json) => ShoeModel(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "quantity": quantity,
      };
}
