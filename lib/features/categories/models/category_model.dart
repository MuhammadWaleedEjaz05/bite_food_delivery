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
      categoryID: json['id'] as String? ?? json['categoryID'] as String? ?? '',
      categoryName:
          json['name'] as String? ?? json['categoryName'] as String? ?? '',
      categoryImage:
          json['image'] as String? ?? json['categoryImage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': categoryID, 'name': categoryName, 'image': categoryImage};
  }

  CategoryModel copyWith({
    String? categoryID,
    String? categoryName,
    String? categoryImage,
  }) {
    return CategoryModel(
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      categoryImage: categoryImage ?? this.categoryImage,
    );
  }

  @override
  List<Object?> get props => [categoryID, categoryName, categoryImage];
}
