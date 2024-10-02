import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  
  Future<ProductModel>updateproduct({
    required String title,
    required String price,
    required String describtion,
    required String category,
    required String image ,
    required dynamic id
    //required String rating
    ,
    })async//i should put ? or required i know it from my friend who created 
  {print('product id = $id');
   Map<String,dynamic>data=await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
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
