import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thameen/core/constants/app_spacing.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:thameen/features/profile/presentation/bloc/change_password/change_password_cubit.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/loading_button.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({
    super.key,
  });

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late TextEditingController _oldPasswordController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _oldPasswordTouched = false;
  bool _passwordTouched = false;
  bool _confirmPasswordTouched = false;
  @override
  void initState() {
    _oldPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isButtonEnabled = true;
    var changePasswordCubit = context.watch<ChangePasswordCubit>();
    if (changePasswordCubit.state is ChangePasswordLoading) {
      isLoading = true;
      isButtonEnabled = false;
    } else {
      isLoading = false;
      isButtonEnabled = true;
    }
    if (changePasswordCubit.state is ChangePasswordSuccess) {
      setState(() {
        _oldPasswordController.text = '';
        _passwordController.text = '';
        _confirmPasswordController.text = '';
        _oldPasswordTouched = false;
        _passwordTouched = false;
        _confirmPasswordTouched = false;
      });
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.kPaddingHorizontal,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            SvgPicture.asset(
              Assets.imagesForgotPassword,
              height: 250,
            ),
            const SizedBox(height: 24),
            Text(
              'Enter your old password and create a new password',
              style: AppTextStyle.bold20,
            ),
            const SizedBox(height: 24),
            PasswordTextFormField(
              hintText: 'Old Password',
              prefixIcon: const Icon(Icons.lock_outline),
              keyboardType: TextInputType.visiblePassword,
              controller: _oldPasswordController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).signinPasswordIsRequired;
                }

                return null;
              },
              autovalidateMode: _oldPasswordTouched
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              onChanged: (value) {
                if (!_oldPasswordTouched) {
                  setState(() {
                    _oldPasswordTouched = true;
                  });
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            PasswordTextFormField(
              hintText: 'New Password',
              prefixIcon: const Icon(Icons.lock_outline),
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).signinPasswordIsRequired;
                }

                if (value.length < 8) {
                  return S.of(context).signupErrorPasswordShort;
                }

                final regex = RegExp(
                  r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+]).{8,}$',
                );

                if (!regex.hasMatch(value)) {
                  return S.of(context).PasswordMustContain;
                }

                return null;
              },
              autovalidateMode: _passwordTouched
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              onChanged: (value) {
                if (!_passwordTouched) {
                  setState(() {
                    _passwordTouched = true;
                  });
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            PasswordTextFormField(
              hintText: S.of(context).signupConfirmPasswordLabel,
              prefixIcon: const Icon(Icons.lock_outline),
              keyboardType: TextInputType.visiblePassword,
              controller: _confirmPasswordController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).signinPasswordIsRequired;
                }
                if (value != _passwordController.text) {
                  return S.of(context).signupErrorPasswordMismatch;
                }
                return null;
              },
              autovalidateMode: _confirmPasswordTouched
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              onChanged: (value) {
                if (!_confirmPasswordTouched) {
                  setState(() {
                    _confirmPasswordTouched = true;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            AppButton(
              child: isLoading
                  ? const LoadingButton()
                  : Text(
                      'Change Password',
                      style: AppTextStyle.bold20,
                    ),
              onPressed: () {
                if (isButtonEnabled) {
                  if (_passwordController.text.isEmpty ||
                      _confirmPasswordController.text.isEmpty ||
                      _oldPasswordController.text.isEmpty) {
                    buildErrorSnackBar(
                      context,
                      S.of(context).signinPasswordIsRequired,
                    );
                    return;
                  }
                  var oldPassword = SharedPreferencesSingleton.getString(
                    'password',
                  );
                  log('oldPassword: $oldPassword');
                  log(
                    'oldPasswordController: ${_oldPasswordController.text}',
                  );

                  if (oldPassword != _oldPasswordController.text) {
                    buildErrorSnackBar(
                      context,
                      'Old password is incorrect',
                    );
                    return;
                  }
                  if (_oldPasswordController.text == _passwordController.text) {
                    buildErrorSnackBar(
                      context,
                      'Old password and new password cannot be the same',
                    );
                    return;
                  }
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    buildErrorSnackBar(
                      context,
                      S.of(context).signupErrorPasswordMismatch,
                    );
                    return;
                  }
                  changePasswordCubit.changePassword(
                    SharedPreferencesSingleton.getString('user'),
                    _passwordController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
