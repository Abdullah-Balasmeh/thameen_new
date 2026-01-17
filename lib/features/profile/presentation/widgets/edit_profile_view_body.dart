import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_profile_phone_text_form_field.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_profile_photo.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_profile_text_form_field.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
  late AutovalidateMode _autovalidateMode;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late String currentImage;
  ValueNotifier<File?> newImage = ValueNotifier(null);
  @override
  void initState() {
    _autovalidateMode = AutovalidateMode.disabled;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _firstNameController.text = widget.user.firstName;
    _lastNameController.text = widget.user.lastName;
    _emailController.text = widget.user.email;
    _phoneController.text = widget.user.phoneNumber;
    currentImage = widget.user.photoUrl ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 16),
              EditProfilePhoto(
                currentImage: currentImage,
                newImage: newImage,
              ),
              const SizedBox(height: 16),
              EditProfileTextFormField(
                hintText: 'First Name',
                prefixIcon: const Icon(Icons.person),
                keyboardType: TextInputType.name,
                controller: _firstNameController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              EditProfileTextFormField(
                hintText: 'Last Name',
                prefixIcon: const Icon(Icons.person),
                keyboardType: TextInputType.name,
                controller: _lastNameController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              EditProfileTextFormField(
                hintText: 'Email Address',
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                textInputAction: TextInputAction.next,
                isEmail: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              EditProfilePhoneTextFormField(
                hintText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length != 13) {
                    return 'Phone number must be 9 digits after +962 7';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppButton(
                child: Text(
                  'Update',
                  style: AppTextStyle.bold20,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    SharedPreferencesSingleton.setString(
                      'userName',
                      '${_firstNameController.text} ${_lastNameController.text}',
                    );
                    context.read<EditProfileCubit>().updateProfile(
                      UserEntity(
                        id: widget.user.id,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailController.text,
                        phoneNumber: _phoneController.text,
                        password: widget.user.password,
                        isEmailVerified: widget.user.isEmailVerified,
                        createdAt: widget.user.createdAt,
                        photoUrl: widget.user.photoUrl,
                        postsId: widget.user.postsId,
                        isOnline: widget.user.isOnline,
                        lastSeen: widget.user.lastSeen,
                      ),
                      newImage.value,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
