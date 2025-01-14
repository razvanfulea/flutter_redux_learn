import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

//<editor-fold desc="Data Methods">
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          description == other.description &&
          category == other.category &&
          image == other.image &&
          rating == other.rating);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode ^
      rating.hashCode;

  @override
  String toString() {
    return 'Product{ id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating,}';
  }

  factory Product.initial() {
    return Product(
      id: 0,
      title: '',
      price: 0.0,
      description: '',
      category: '',
      image: '',
      rating: Rating.initial(),
    );
  }

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    var product = Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: (map['price'] is int) ? (map['price'] as int).toDouble() : map['price'] as double,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: Rating.fromMap(map['rating']),
    );
    return product;
  }

  @override
  List<Object?> get props => [id, title, price, description, category, image, rating];

//</editor-fold>
}

class Rating extends Equatable {
  final double rate;
  final int count;

//<editor-fold desc="Data Methods">
  const Rating({
    required this.rate,
    required this.count,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rating && runtimeType == other.runtimeType && rate == other.rate && count == other.count);

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;

  @override
  String toString() {
    return 'Rating{ rate: $rate, count: $count,}';
  }

  factory Rating.initial() {
    return const Rating(
      rate: 0.0,
      count: 0,
    );
  }

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: (map['rate'] is int) ? (map['rate'] as int).toDouble() : map['rate'] as double,
      count: map['count'] as int,
    );
  }

  @override
  List<Object?> get props => [rate, count];

//</editor-fold>
}
