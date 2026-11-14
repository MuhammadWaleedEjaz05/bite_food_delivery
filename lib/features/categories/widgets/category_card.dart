import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/features/categories/models/category_model.dart';
import 'package:bite_food_delivery/widgets/app_category_card.dart';
import 'package:material_ui/material_ui.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) => AppCategoryCard(
    name: category.categoryName,
    imageUrl: category.categoryImage,
    onTap: () => AppNavigation.push(
      context,
      '/discover/category/${Uri.encodeComponent(category.categoryName)}',
    ),
  );
}

// Backward-compatibility alias
typedef BiteCategoryCard = CategoryCard;

