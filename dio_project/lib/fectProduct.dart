import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

Future<List<ProductModel>> fetchProducts() async {
  final dio = Dio(); // Create a Dio instance

  try {
    final response = await dio.get('http://bootcamp.cyralearnings.com/view_offerproducts.php');

    if (response.statusCode == 200) {
      print(response.statusCode);
      final parsed =response.data.cast<Map<String, dynamic>>();

      return parsed.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print(e.toString());
    throw Exception('Failed to load products: $e');
  }
}


  
class ProductModel {
  int? id;
  int? catid;
  String? productname;
  double? price;
  String? image;
  String? description;

  ProductModel({
    this.id,
    this.catid,
    this.productname,
    this.price,
    this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        catid: json["catid"],
        productname: json["productname"],
        price: json["price"]?.toDouble(),
        image: json["image"],
        description: json["description"],
      );

}