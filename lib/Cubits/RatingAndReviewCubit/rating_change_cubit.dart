import 'package:flutter_bloc/flutter_bloc.dart';

class RatingChangeCubit extends Cubit<Map<String, double>> {
  RatingChangeCubit() : super({});

  void changeRating(String type, double rating) {
    final newState = Map<String, double>.from(state);
    newState[type] = rating;
    emit(newState);
  }
}
