import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String categoryID;
  final String categoryName;
  final String categoryImage;

  const CategoryModel({
    required this.categoryID,
    required this.categoryName,
    required this.categoryImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryID: json['id'] as String,
      categoryName: json['name'] as String,
      categoryImage: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': categoryID, 'name': categoryName, 'image': categoryImage};
  }

  @override
  List<Object?> get props => [categoryID, categoryName, categoryImage];
}
