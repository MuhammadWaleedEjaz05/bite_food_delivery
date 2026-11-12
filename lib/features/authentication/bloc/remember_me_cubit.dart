import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'remember_me_state.dart';

/// Stores an optional email only. Authentication persistence belongs to Firebase.
class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit(this._preferences)
    : super(
        RememberMeState(
          isRememberMe: _preferences.getBool('rememberMeBool') ?? false,
          email: _preferences.getString('rememberMeEmail'),
        ),
      );
  final SharedPreferences _preferences;
  Future<void> toggleRememberMe(bool value, {String? email}) async {
    await _preferences.remove('rememberMePassword');
    if (value) {
      await _preferences.setString('rememberMeEmail', email?.trim() ?? '');
    } else {
      await _preferences.remove('rememberMeEmail');
    }
    await _preferences.setBool('rememberMeBool', value);
    if (!isClosed) {
      emit(
        RememberMeState(
          isRememberMe: value,
          email: value ? email?.trim() : null,
        ),
      );
    }
  }
}
