//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoriesServices 
{
 Future<List<ProductModel>>getcategoriesProducts  ({required String categoryname})async{

  // http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$categoryname'));//i know that is get request from the postman
 
List<dynamic>data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryname');
 
  List<ProductModel>productsList = []; //an empty list to store on it
  for (int i = 0; i < data.length; i++) {
    productsList.add(ProductModel.fromjson(data[i]));// data[i] the list that has the data inside it
  }
  return productsList;

 }
}