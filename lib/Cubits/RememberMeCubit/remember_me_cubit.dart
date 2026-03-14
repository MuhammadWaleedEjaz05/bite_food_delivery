import 'package:bite_food_delivery/configs/shared_preference_functions.dart';
import 'package:bloc/bloc.dart';
part 'remember_me_state.dart';

class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(RememberMeState(isRememberMe: false));

  void toggleRememberMe(bool value, {String? email, String? password}) {
    if (value) {
      saveToSharedPreferenceString('rememberMeEmail', email ?? '');
      saveToSharedPreferenceString('rememberMePassword', password ?? '');
      saveToSharedPreferencebool('rememberMeBool', true);
      emit(
        RememberMeState(isRememberMe: true, email: email, password: password),
      );
    } else {
      _clearRememberMe();
    }
  }

  void _clearRememberMe() {
    saveToSharedPreferenceString('rememberMeEmail', '');
    saveToSharedPreferenceString('rememberMePassword', '');
    saveToSharedPreferencebool('rememberMeBool', false);
    emit(RememberMeState(isRememberMe: false));
  }

  void getRememberMeData() {
    String? email = getFromSharedPreferenceString('rememberMeEmail');
    String? password = getFromSharedPreferenceString('rememberMePassword');
    bool? isRememberMe = getFromSharedPreferencebool('rememberMeBool');
    emit(
      RememberMeState(
        isRememberMe: isRememberMe ?? false,
        email: email,
        password: password,
      ),
    );
  }
}
