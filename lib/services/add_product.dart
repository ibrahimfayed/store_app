import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
  Future<ProductModel>addproduct({
    required String title,
    required String price,
    required String describtion,
    required String category,
    required String image ,
    //required String rating
    })async//i should put ? or required i know it from my friend who created 
  {
   Map<String,dynamic>data=await Api().post(url: 'https://fakestoreapi.com/products', body: {
'title':title,
'price':price,
'describtion':describtion,
'category':category,
'image':image,
//'rating':rating
   });
   return ProductModel.fromjson(data);
  }
  
}