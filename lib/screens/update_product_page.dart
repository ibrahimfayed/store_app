import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custum_button.dart';
import 'package:store_app/widgets/custum_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? ProductName, Describtion, image;
  String? price;
  bool  isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(//prefered to be above scaffold and must be above singlechildscroll view.
      inAsyncCall: isloading,//it make it shown or not
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustumFormTextField(
                onChanged: (data) {
                  //here i don't need validation because the user may don't want to enter any thing inside update
                  ProductName = data;
                },
                HentText: 'Product Name',
              ),
              SizedBox(
                height: 10,
              ),
              CustumFormTextField(
                onChanged: (data) {
                  Describtion = data;
                },
                HentText: 'Describtion',
              ),
              SizedBox(
                height: 10,
              ),
              CustumFormTextField(
                onChanged: (data) {
                  price = data;
                },
                HentText: 'Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              CustumFormTextField(
                onChanged: (data) {
                  image = data;
                },
                HentText: 'image',
              ),
              SizedBox(
                height: 50,
              ),
              CustumBotton(
                text: 'Update',
                onTap: () async {
                  isloading = true;
                  setState((){}); //to update ui

                     try {
                      await UpdateProduct(product);
                      print('success');
                    } catch (e) {
                      print(e.toString());
                   
                    }
                      isloading = false;
                      setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

 Future<void>  UpdateProduct(ProductModel product)async {
   await UpdateProductService().updateproduct(
        id:  product.id,
        title: ProductName == null ? product.title :  ProductName!,//if it is null return to me the previous product name
        price: price == null ? product.price.toString() : price! ,
        describtion: Describtion ==null? product.description : Describtion!,
        category:  product.category,
        image: image ==null ?product.image : image!);
        
  }
}
//if problem happens in this app or another apps in renderflex overflow there is a solution in vedio store user input