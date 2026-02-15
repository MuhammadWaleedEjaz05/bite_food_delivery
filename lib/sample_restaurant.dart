import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:uuid/uuid.dart';
final uuid = Uuid();
List<RestaurantModel> sampleRestaurants = [
  RestaurantModel(id: uuid.v4(), name: 'Al Kaif Pizza & Burger - Mall of Multan', logoUrl: 'assets/images/alkhairpizza.jpg',  description: 'Best pizza and burger in Multan', address: 'Mall of Multan', rating: 4.5, reviewsCount: 120, deliveryFee: 49, distance: 2.5, isOpen: true, category: 'Fast Food'),
  RestaurantModel(id: uuid.v4(), name: "Timmy's - Mall of Multan", logoUrl: 'assets/images/timmys.jpg', description: "Timmy's is a great place for fast food and drinks", address: 'Mall of Multan', rating: 4.2, reviewsCount: 90, deliveryFee: 50, distance: 3.0, isOpen: true, category: 'Fast Food'),
  RestaurantModel(id: uuid.v4(), name: 'Cheezy Slice', logoUrl: 'assets/images/cheezyslice.jpg', description: 'Cheezy Slice is a great place for pizza and burgers', address: 'Mall of Multan', rating: 4.0, reviewsCount: 80, deliveryFee: 55, distance: 2.0, isOpen: true, category: 'Fast Food'),
  RestaurantModel(id: uuid.v4(), name: 'LIT - Bypass', logoUrl: 'assets/images/lit.jpg', description: 'LIT is a great place for fast food and drinks', address: 'Northern Bypass', rating: 4.3, reviewsCount: 100, deliveryFee: 60, distance: 4.0, isOpen: true, category: 'Fast Food'),
  RestaurantModel(id: uuid.v4(), name: 'Hardee\'s - Mall of Multan', logoUrl: 'assets/images/hardees.jpg', description: 'Hardee\'s is a great place for fast food and drinks', address: 'Mall of Multan', rating: 4.1, reviewsCount: 70, deliveryFee: 52, distance: 2.8, isOpen: true, category: 'Fast Food'),
  RestaurantModel(id: uuid.v4(), name: 'Kababjees Fried Chicken - Mall of Multan', logoUrl: 'assets/images/kebabjees.jpg', description: 'Kababjees is a great place for fried chicken', address: 'Mall of Multan', rating: 4.2, reviewsCount: 95, deliveryFee: 58, distance: 2.2, isOpen: true, category: 'Fast Food')
];
