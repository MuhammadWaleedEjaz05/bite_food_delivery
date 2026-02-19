import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_item_state.dart';

class FoodItemCubit extends Cubit<FoodItemState> {
  FoodItemCubit() : super(FoodItemInitial()) {
    loadFoodItem();
  }

  Future<void> loadFoodItem() async {
    emit(FoodItemLoading());
    try {
      final db = getCollection('FoodItemsDB');
      await db.get().then((data) {
        final foodItems = data.docs
            .map(
              (doc) =>
                  FoodItemModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
        emit(FoodItemLoaded(foodItems: foodItems));
      });
    } catch (e) {
      emit(FoodItemError(message: e.toString()));
    }
  }

  // Future<void> uploadFoodItem() async {
  //   emit(FoodItemUploading());
  //   try {
  //     for (final restaurant in sampleFoodItems) {
  //       final cloudinary = Cloudinary.signedConfig(
  //         apiKey: '154652931217786',
  //         apiSecret: 'VbVfZSTn0f6hxoLOGOpZ33DzM58',
  //         cloudName: 'dooej7wa6',
  //       );

  //       final byteData = await rootBundle.load(restaurant.images[0]);
  //       final byteImage = byteData.buffer.asUint8List();

  //       final response = await cloudinary.upload(
  //         fileBytes: byteImage,
  //         fileName: restaurant.name,
  //         resourceType: CloudinaryResourceType.image,
  //         folder: 'FoodItems',
  //       );

  //       final imageUrl = response.secureUrl;
  //       final restaurantWithImage = restaurant.copyWith(
  //         images: [imageUrl ?? ''],
  //       );
  //       final db = getCollection('FoodItemsDB');
  //       await db.doc(restaurant.id).set(restaurantWithImage.toJson());
  //     }
  //   } catch (e) {
  //     emit(FoodItemError(message: e.toString()));
  //   }
  // }
}
