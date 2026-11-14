import 'package:bite_food_delivery/features/onboarding/bloc/first_time_launch_state.dart';
import 'package:bite_food_delivery/core/utils/shared_preference_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstTimeLaunchCubit extends Cubit<FirstTimeLaunchState> {
  FirstTimeLaunchCubit() : super(const FirstTimeLaunchInitial());

  Future<void> checkFirstTimeLaunch() async {
    try {
      final isFirstTimeLaunched = getFromSharedPreferencebool(
        'isFirstTimeLaunched',
      );
      if (isFirstTimeLaunched == null || isFirstTimeLaunched == true) {
        emit(const FirstTimeLaunched());
      } else {
        emit(const NotFirstTimeLaunched());
      }
    } catch (e) {
      emit(FirstTimeLaunchError(errorMessage: e.toString()));
    }
  }

  void setFirstTimeLaunched() {
    try {
      saveToSharedPreferencebool('isFirstTimeLaunched', false);
      emit(const NotFirstTimeLaunched());
    } catch (e) {
      emit(FirstTimeLaunchError(errorMessage: e.toString()));
    }
  }
}
