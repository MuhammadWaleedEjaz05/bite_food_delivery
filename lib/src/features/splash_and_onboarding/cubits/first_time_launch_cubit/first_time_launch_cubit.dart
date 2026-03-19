import 'package:bite_food_delivery/src/core/utils/shared_preference_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'first_time_launch_state.dart';

class FirstTimeLaunchCubit extends Cubit<FirstTimeLaunchState> {
  FirstTimeLaunchCubit() : super(FirstTimeLaunchInitial());

  Future<void> checkFirstTimeLaunch() async {
    try {
      final bool? isFirstTimeLaunched = getFromSharedPreferencebool(
        'isFirstTimeLaunched',
      );
      if (isFirstTimeLaunched == null || isFirstTimeLaunched == true) {
        emit(FirstTimeLaunched());
      } else {
        emit(NotFirstTimeLaunched());
      }
    } catch (e) {
      emit(FirstTimeLaunchError(errorMessage: e.toString()));
    }
  }

  void setFirstTimeLaunched() {
    try {
      saveToSharedPreferencebool('isFirstTimeLaunched', false);
      emit(NotFirstTimeLaunched());
    } catch (e) {
      emit(FirstTimeLaunchError(errorMessage: e.toString()));
    }
  }
}
