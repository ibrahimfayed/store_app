import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:store_app/helper/api.dart';

class AllCategoriesServices
 {
  Future<List<dynamic>>getAllProducts()async{//the return here must be string of dynamic or map of string and dynamic
   
 // http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));//i know that is get request from the postman
 //i put if start from the part of decode.
List<dynamic>data = await Api().get(url: 'https://fakestoreapi.com/products/categories');
  
  return data;


  } 
}