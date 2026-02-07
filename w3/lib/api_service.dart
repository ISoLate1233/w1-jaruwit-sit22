import 'dart:convert';

import 'package:w3_jaruwit/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
    static Future<List<Product>> fetchProduct() async{
      final response = await   http.get(Uri.parse("https://6964b1fbe8ce952ce1f28b7d.mockapi.io/products"));

      if (response.statusCode == 200){
        final List data = jsonDecode(response.body);
        return data.map((e) => Product.formJson(e)).toList();
      }
      else{
        throw Exception('โหลดไม่สำเร็จ');
      }

    }

}