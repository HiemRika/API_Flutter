import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';


class ApiService {
  static Future<List<ProductModel>> read() async {
    final String url = "https://fakestoreapi.com/products";
    try{
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(productmodelFromJson, response.body);
      } 
      else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }
}