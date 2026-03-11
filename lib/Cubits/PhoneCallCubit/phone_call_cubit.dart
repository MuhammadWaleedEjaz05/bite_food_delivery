import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

part 'phone_call_state.dart';

class PhoneCallCubit extends Cubit<PhoneCallState> {
  PhoneCallCubit() : super(PhoneCallInitial());

  Future<void> makePhoneCall(String phoneNumber) async {
    emit(PhoneCallInProgress(phoneNumber));
    try {
      final bool? callMade = await FlutterPhoneDirectCaller.callNumber(
        phoneNumber,
      );
      if (callMade == null || !callMade) {
        emit(const PhoneCallFailure('Failed to make the phone call.'));
        return;
      }
      emit(PhoneCallSuccess(phoneNumber));
    } catch (e) {
      emit(PhoneCallFailure(e.toString()));
    }
  }
}
