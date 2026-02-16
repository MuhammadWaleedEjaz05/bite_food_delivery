import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bite_food_delivery/configs/sample_restaurants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/services.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit() : super(RestaurantsInitial()) {
    loadRestaurants();
  }

  Future<void> loadRestaurants() async {
    emit(RestaurantsLoading());
    try {
      final db = getCollection('RestaurantsDB');
      await db.get().then((data) {
        final restaurants = data.docs
            .map(
              (doc) =>
                  RestaurantModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
        emit(RestaurantsLoaded(restaurants: restaurants));
      });
    } catch (e) {
      emit(RestaurantsError(message: e.toString()));
    }
  }

  Future<void> uploadRestaurants() async {
    emit(RestaurantsUploading());
    try {
      for (final restaurant in sampleRestaurants) {
        final cloudinary = Cloudinary.signedConfig(
          apiKey: '154652931217786',
          apiSecret: 'VbVfZSTn0f6hxoLOGOpZ33DzM58',
          cloudName: 'dooej7wa6',
        );

        final byteData = await rootBundle.load(restaurant.logoUrl);
        final byteImage = byteData.buffer.asUint8List();

        final response = await cloudinary.upload(
          fileBytes: byteImage,
          fileName: restaurant.name,
          resourceType: CloudinaryResourceType.image,
          folder: 'Restaurants',
        );

        final imageUrl = response.secureUrl;
        final restaurantWithImage = restaurant.copyWith(logoUrl: imageUrl);

        final db = getCollection('RestaurantsDB');
        await db.doc(restaurant.id).set(restaurantWithImage.toJson());
      }
    } catch (e) {
      emit(RestaurantsError(message: e.toString()));
    }
  }
}
