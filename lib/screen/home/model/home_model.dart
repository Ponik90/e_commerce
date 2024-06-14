class HomeModel {
  String? description, title, category, image;
  int? id;
  dynamic price;
  RatingModel? rating;

  HomeModel(
      {this.description,
      this.title,
      this.category,
      this.image,
      this.id,
      this.price,
      this.rating});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      title: m1['title'],
      price: m1['price'],
      description: m1['description'],
      category: m1['category'],
      image: m1['image'],
      rating: RatingModel.mapToModel(m1['rating']),
    );
  }
}

class RatingModel {
  dynamic rate;
  int? count;

  RatingModel({this.count, this.rate});

  factory RatingModel.mapToModel(Map m1) {
    return RatingModel(count: m1['count'], rate: m1['rate']);
  }
}
