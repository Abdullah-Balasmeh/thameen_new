import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/profile/domain/edit_profile_repo.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitial());
  final EditProfileRepo editProfileRepo;
  Future<void> getUser() async {
    emit(EditProfileLoading());
    try {
      final userId = SharedPreferencesSingleton.getString('user');
      final result = await editProfileRepo.getUser(userId);
      result.fold(
        (failure) => emit(EditProfileFailure(errMessage: failure.errorMessage)),
        (user) => emit(EditProfileSuccess(user: user)),
      );
    } catch (e) {
      emit(EditProfileFailure(errMessage: e.toString()));
    }
  }
}
