import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustumCard extends StatelessWidget {
   CustumCard({
    super.key,required this.product
  });

 ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(//to move to a new page
       onTap: () {
         Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
       },
      child: Stack(//stack widget put the widgets above of each other
      clipBehavior: Clip.none,//make the picture don't clipped 
        children: [
            
        Container(
          
          //here i can control with shadow shown in vidio 311 product card
          // height: 130, i used childaspectratio instead of it
          // width: 150,
          child: Card(//to make the card don't full the screen i wrap it with container to give it width and height
            elevation: 10,//to lift the card widget and make the shadow appears
            child: Padding(
              
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.substring(0,6)
                  ,style: TextStyle(
                    color: Colors.grey
                  ),
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               // Text(r'$' '${product.price.toStringAsFixed(2)}'),
                Text( r'$' '${product.price.toString()}'),
                 Icon(Icons.favorite,
                 color: Colors.red,)//if i don't find icon i search for i will search on the site any thing about this item without writing flutte after search
               ],     
                  ),
                 
                ],
              ),
            ),
          ),
        ),
         Positioned(
        
         right: 10,
         top: -60,
      
          child: Image.network(
            product.image,
          height: 150,
          width: 90,
          )),//Positioned used to move it inside the stack widget
      ],
        
      ),
    );
  }
}