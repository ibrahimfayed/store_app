//افصل كل السيرفيسيس عن بعض كده عشان لو عملتهم في فايل واحد هتبقي عذاب
import 'dart:convert';

//import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
class AllProductServices 
{
Future<List<ProductModel>> getAllProducts()async {//i know that the return is list from api  and () empty because i just make a send 

 // http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'));//i know that is get request from the postman
  //response.statusCode; //it refers to the code stutus is good or not and there is 5 phases to it in google if it is 200and above everything is good 400 and above means that the error from my code 500 and above from server not from me
   List<dynamic>data = await Api().get(url: 'https://fakestoreapi.com/products');
 // if (response.statusCode==200)//i take this value from postman
   //{
  
  
  List<ProductModel>productsList = []; //an empty list to store on it
  for (int i = 0; i < data.length; i++) {
    productsList.add(ProductModel.fromjson(data[i]));// data[i] the list that has the data inside it
  }
  return productsList;
}
// else {
//   throw Exception('there is a problem in statusCode ${response.statusCode}');
// }
} 
