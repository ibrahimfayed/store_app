import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';
import 'package:store_app/widgets/custum_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       actions: [
        IconButton(
         onPressed: (){},
          icon: Icon(FontAwesomeIcons.cartPlus))//if i don't find the icon we can use font_awesome_flutter package
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('New Trend'),
          
      ),
    
      body:
      Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 50),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProducts(),//i put my data here
          builder:(context,snapshot){
            if (snapshot.hasData) {
              List<ProductModel>products = snapshot.data!;
  return GridView.builder(//to repeat the widget top,buttom,right,left
            clipBehavior: Clip.none
            ,itemCount: products.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3//here i control to the ratio of width againest height
            ,crossAxisSpacing: 10//on the secondary axis not primary here x axis        
            ,mainAxisExtent: 150,
            mainAxisSpacing: 50
            ),
             itemBuilder: (context,index)
          {
            return CustumCard(product: products[index],);//any widget have shadow  i use card widget instead of container
          });
}else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }else{
  return Center(child: CircularProgressIndicator());
}
          } ,)
      )
       
    );
  }
}

