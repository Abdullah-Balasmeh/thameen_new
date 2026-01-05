import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/constants/app_spacing.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/core/utils/helper/phone_service.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/auth/presentation/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:thameen/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:thameen/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:thameen/features/auth/presentation/widgets/phone_text_form_field.dart';
import 'package:thameen/features/auth/presentation/widgets/terms_and_conditions_widget.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/app_text_from_field.dart';
import 'package:thameen/shared/widgets/loading_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  late AutovalidateMode _autovalidateMode;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _firstNameTouched = false;
  bool _lastNameTouched = false;
  bool _emailTouched = false;
  bool _phoneTouched = false;
  bool _passwordTouched = false;
  bool _confirmPasswordTouched = false;
  bool isTermsAccepted = false;
  static const String kJordanPrefix = '+962 7 ';
  @override
  void initState() {
    super.initState();
    _autovalidateMode = AutovalidateMode.disabled;
    // Ensure initial unremovable prefix is present
    _phoneController.text = kJordanPrefix;
    _phoneController.selection = TextSelection.collapsed(
      offset: _phoneController.text.length,
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String _extractLocalDigits(String full) {
    if (!full.startsWith(kJordanPrefix)) return '';
    return full.substring(kJordanPrefix.length);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isButtonEnabled = true;
    var signUpCubit = context.watch<SignUpCubit>();
    if (signUpCubit.state is SignUpLoading) {
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
                hintText: S.of(context).signupFirstNameLabel,
                prefixIcon: const Icon(Icons.person_outlined),
                keyboardType: TextInputType.name,
                controller: _firstNameController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).signupErrorFirstNameShort;
                  }
                  if (value.length < 2) {
                    return S.of(context).signupErrorFirstNameShort;
                  }
                  // If allowing Arabic too, use:
                  final isLettersOnly = RegExp(
                    r'^[A-Za-z\u0600-\u06FF]+$',
                  ).hasMatch(value);

                  if (!isLettersOnly) {
                    return S.of(context).signupErrorFirstNameShort;
                  }
                  return null;
                },
                autovalidateMode: _firstNameTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (value) {
                  if (!_firstNameTouched) {
                    setState(() {
                      _firstNameTouched = true;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextFromField(
                hintText: S.of(context).signupLastNameLabel,
                prefixIcon: const Icon(Icons.person_outlined),
                keyboardType: TextInputType.name,
                controller: _lastNameController,
                textInputAction: TextInputAction.next,
                autovalidateMode: _lastNameTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (value) {
                  if (!_lastNameTouched) {
                    setState(() {
                      _lastNameTouched = true;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).signupErrorLastNameShort;
                  }
                  if (value.length < 2) {
                    return S.of(context).signupErrorLastNameShort;
                  }

                  // English letters only:
                  // final isLettersOnly = RegExp(r'^[A-Za-z]+$').hasMatch(value);

                  // If allowing Arabic too, use:
                  final isLettersOnly = RegExp(
                    r'^[A-Za-z\u0600-\u06FF]+$',
                  ).hasMatch(value);

                  if (!isLettersOnly) {
                    return S.of(context).signupErrorLastNameShort;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              PhoneTextFormField(
                prefix: kJordanPrefix,
                inputFormatters: <TextInputFormatter>[
                  JordanPhoneFormatter(prefix: kJordanPrefix),
                ],
                hintText: S.of(context).signupPhoneLabel,
                prefixIcon: const Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).PhoneNumberIsRequired;
                  }
                  if (!value.startsWith(kJordanPrefix)) {
                    return S.of(context).InvalidPhoneNumberFormat;
                  }
                  final local = _extractLocalDigits(value);
                  if (local.length != 8) {
                    return S.of(context).InvalidPhoneNumberDigits;
                  }
                  if (!RegExp(r'^\d{8}$').hasMatch(local)) {
                    return S.of(context).OnlyDigitsAllowed;
                  }
                  return null;
                },
                autovalidateMode: _phoneTouched
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                onChanged: (value) {
                  if (!_phoneTouched) {
                    setState(() {
                      _phoneTouched = true;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextFromField(
                hintText: S.of(context).signupEmailLabel,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).signinEmailAddressIsRequired;
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return S.of(context).signupErrorEmailInvalid;
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
                height: 16,
              ),
              PasswordTextFormField(
                hintText: S.of(context).signupPasswordLabel,
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
              const SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(
                onChanged: (bool value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                child: isLoading
                    ? const LoadingButton()
                    : Text(
                        S.of(context).signupButton,
                        style: AppTextStyle.bold20,
                      ),
                onPressed: () {
                  if (isButtonEnabled) {
                    if (_formKey.currentState!.validate()) {
                      if (!isTermsAccepted) {
                        buildErrorSnackBar(context, 'يجب قبول الشروط والأحكام');
                        return;
                      }
                      final local8 = _extractLocalDigits(
                        _phoneController.text,
                      ); // 8 digits
                      final e164 =
                          '+9627$local8'; // E.164 without spaces if needed
                      context
                          .read<SignUpCubit>()
                          .createUserWWithEmailAndPassword(
                            UserEntity(
                              id: '',
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              phoneNumber: e164,
                              email: _emailController.text.toLowerCase(),
                              password: _passwordController.text,
                              isEmailVerified: false,
                              createdAt: DateTime.now().toString(),
                              photoUrl: '',
                              postsId: [],
                            ),
                            _passwordController.text,
                          );
                    }
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
