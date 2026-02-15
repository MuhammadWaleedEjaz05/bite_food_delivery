import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectionCubit extends Cubit<String> {
  CategorySelectionCubit() : super('');

  void selectCategory(String category) {
    emit(category);
  }
}
