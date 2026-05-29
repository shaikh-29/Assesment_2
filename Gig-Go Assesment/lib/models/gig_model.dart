class GigModel {
  final int id;
  final String name;
  final String title;
  final String category;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final bool isTopRated;
  final bool isInstantBook;
  final bool isAvailable;
  final List<String> skills;

  GigModel({
    required this.id,
    required this.name,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.isTopRated,
    required this.isInstantBook,
    required this.isAvailable,
    required this.skills,
  });

  factory GigModel.fromJson(Map<String, dynamic> json) {
    return GigModel(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      imageUrl: json['imageUrl'],
      isTopRated: json['isTopRated'],
      isInstantBook: json['isInstantBook'],
      isAvailable: json['isAvailable'],
      skills: List<String>.from(json['skills']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'category': category,
      'description': description,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'imageUrl': imageUrl,
      'isTopRated': isTopRated,
      'isInstantBook': isInstantBook,
      'isAvailable': isAvailable,
      'skills': skills,
    };
  }
}