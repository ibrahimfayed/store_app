//هعملها رن للكود عادي علي ايدج و هيشتغل و أشرحلها ان في مشكلة في api نفسه لأنه وهمي
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const store_app());
}


class store_app extends StatelessWidget {
  const store_app({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context) => HomePage(),
        UpdateProductPage.id :(context) => UpdateProductPage()
        },
      initialRoute: HomePage.id,
    );
  }
}