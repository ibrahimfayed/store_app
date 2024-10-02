class ProductModel 
{
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel rating;
  final String category;

  ProductModel({//all are required because of null safety
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating
    });
  
  factory ProductModel.fromjson(jsonData){
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      //price: double.parse(jsonData['price']),
      price: jsonData['price'] as dynamic,
      description:jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: RatingModel.fromjson(jsonData['rating']) //here take the map and return me model
      );
  }

}

class RatingModel//and use it inside the father model
{
  final dynamic rate;
  final dynamic count;

  RatingModel({
    required this.rate,
    required this.count
    });
    factory RatingModel.fromjson(jsonData){
      return RatingModel(rate: jsonData['rate'],
       count: jsonData['count']);
    }
}