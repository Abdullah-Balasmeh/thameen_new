import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/profile/domain/repo/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());
  final ChangePasswordRepo changePasswordRepo;
  Future<void> changePassword(String userId, String newPassword) async {
    emit(ChangePasswordLoading());
    try {
      await changePasswordRepo.changePassword(userId, newPassword);
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(e.toString()));
    }
  }
}
