import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thameen/core/constants/app_spacing.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/auth/presentation/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:thameen/features/auth/presentation/widgets/dont_have_an_account_widget.dart';
import 'package:thameen/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:thameen/features/auth/presentation/widgets/remember_me_and_forget_password.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/app_text_from_field.dart';
import 'package:thameen/shared/widgets/loading_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();
  late AutovalidateMode _autovalidateMode;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = false;
  bool _emailTouched = false;
  bool _passwordTouched = false;

  @override
  void initState() {
    _autovalidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isButtonEnabled = true;
    var signInCubit = context.watch<SignInCubit>();
    if (signInCubit.state is SignInLoading) {
      isLoading = true;
      isButtonEnabled = false;
    } else {
      isLoading = false;
      isButtonEnabled = true;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.kPaddingHorizontal,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              AppTextFromField(
                hintText: S.of(context).signinEmailLabel,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).signinEmailAddressIsRequired;
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return S.of(context).signinErrorInvalidEmail;
                  }
                  return null;
                },
                autovalidateMode: _emailTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (value) {
                  if (!_emailTouched) {
                    setState(() {
                      _emailTouched = true;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              PasswordTextFormField(
                hintText: S.of(context).signinPasswordLabel,
                prefixIcon: const Icon(Icons.lock_outline),
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).signinPasswordIsRequired;
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
                height: 24,
              ),
              RememberMeAndForgetPassword(
                onChanged: (value) {
                  isRememberMe = value;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              AppButton(
                child: isLoading
                    ? const LoadingButton()
                    : Text(
                        S.of(context).signinButton,
                        style: AppTextStyle.bold20,
                      ),
                onPressed: () {
                  if (isButtonEnabled) {
                    if (_formKey.currentState!.validate()) {
                      context.read<SignInCubit>().signInWithEmailAndPassword(
                        _emailController.text.toLowerCase(),
                        _passwordController.text,
                        isRememberMe,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 24),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 24),
              SvgPicture.asset(
                Assets.imagesLoginSvg,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
