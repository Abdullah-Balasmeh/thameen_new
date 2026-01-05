import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/constants/jordan_cities.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/post%20item/data/models/item_category.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/post%20item/presentation/bloc/create_post_cubit/create_post_cubit.dart';
import 'package:thameen/features/post%20item/presentation/widgets/anonymous_toggle.dart';
import 'package:thameen/features/post%20item/presentation/widgets/bounty_section.dart';
import 'package:thameen/features/post%20item/presentation/widgets/contact_methods_check_boxes.dart';
import 'package:thameen/features/post%20item/presentation/widgets/drop_down_form_button_category.dart';
import 'package:thameen/features/post%20item/presentation/widgets/drop_down_form_button_city.dart';
import 'package:thameen/features/post%20item/presentation/widgets/photo_upload.dart';
import 'package:thameen/features/post%20item/presentation/widgets/report_text_form_field.dart';
import 'package:thameen/features/post%20item/presentation/widgets/report_type_selector.dart';
import 'package:thameen/features/post%20item/presentation/widgets/section_title.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/loading_button.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  PostEntity? postEntity;
  final formKey = GlobalKey<FormState>();
  late AutovalidateMode autovalidateMode;
  final ValueNotifier<PostType> selectedType = ValueNotifier(PostType.lost);
  late TextEditingController itemNameController;
  late TextEditingController itemCategoryController;
  late TextEditingController itemDescriptionController;
  late TextEditingController itemLocationController;
  late TextEditingController bountyController;
  final ValueNotifier<bool> postAnonymously = ValueNotifier(false);
  late ValueNotifier<List<ContactMethod>> selectedContactMethods =
      ValueNotifier([]);
  late ValueNotifier<List<File>> selectedPhotos = ValueNotifier([]);
  bool nameTouched = false;
  bool contactMethodsError = false;
  @override
  void initState() {
    autovalidateMode = AutovalidateMode.disabled;
    itemNameController = TextEditingController();
    itemCategoryController = TextEditingController();
    itemDescriptionController = TextEditingController();
    itemLocationController = TextEditingController();
    bountyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    itemNameController.dispose();
    itemCategoryController.dispose();
    itemDescriptionController.dispose();
    itemLocationController.dispose();
    bountyController.dispose();
    super.dispose();
  }

  List<ItemCategoryModel> categories = [
    const ItemCategoryModel(name: 'Electronics', emoji: '📱'),
    const ItemCategoryModel(name: 'Documents', emoji: '📄'),
    const ItemCategoryModel(name: 'Clothing', emoji: '👕'),
    const ItemCategoryModel(name: 'Accessories', emoji: '👜'),
    const ItemCategoryModel(name: 'Bags', emoji: '💼'),
    const ItemCategoryModel(name: 'Keys', emoji: '🔑'),
    const ItemCategoryModel(name: 'Pets', emoji: '🐶'),
    const ItemCategoryModel(name: 'Other', emoji: '📦'),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isButtonEnabled = true;
    var createPostCubit = context.watch<CreatePostCubit>();
    if (createPostCubit.state is CreatePostLoading) {
      isLoading = true;
      isButtonEnabled = false;
    } else {
      isLoading = false;
      isButtonEnabled = true;
    }
    if (createPostCubit.state is CreatePostSuccess) {
      itemNameController.clear();
      itemCategoryController.clear();
      itemDescriptionController.clear();
      itemLocationController.clear();
      bountyController.clear();
      selectedType.value = PostType.lost;
      selectedContactMethods.value = [];
      selectedPhotos.value = [];
      setState(() {
        contactMethodsError = false;
      });
    }
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReportTypeSelector(
            selectedType: selectedType,
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: 'Item Information'),
          const SizedBox(height: 16),
          ReportTextFormField(
            maxLines: 1,
            keyboardType: TextInputType.name,
            controller: itemNameController,
            hintText: 'Item Name',
            prefixIcon: const Icon(Icons.label),
            textInputAction: TextInputAction.next,
            autovalidateMode: nameTouched
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            onChanged: (_) {
              if (!nameTouched) {
                setState(() {
                  nameTouched = true;
                });
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an item name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          DropDownFormButtonCategory(
            itemList: categories,
            hintText: 'Select Category',
            prefixIcon: const Icon(Icons.category),
            keyboardType: TextInputType.text,
            controller: itemCategoryController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an item category';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                itemCategoryController.text = value;
              });
            },
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 16),
          ReportTextFormField(
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            controller: itemDescriptionController,
            hintText: 'Item Description',
            prefixIcon: const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Icon(Icons.description),
            ),

            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an item description';
              }
              return null;
            },
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: 'Location'),
          const SizedBox(height: 16),
          DropDownFormButtonCity(
            city: jordanCities,
            hintText: 'Select City',
            prefixIcon: const Icon(Icons.location_city),
            keyboardType: TextInputType.text,
            controller: itemLocationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an item location';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                itemLocationController.text = value;
              });
            },
            autovalidateMode: autovalidateMode,
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<PostType>(
            valueListenable: selectedType,
            builder: (context, value, _) {
              return Visibility(
                visible: value == PostType.lost,
                child: BountySection(
                  bountyController: bountyController,
                  autovalidateMode: autovalidateMode,
                ),
              );
            },
          ),

          const SizedBox(height: 16),
          const SectionTitle(title: 'Privacy'),
          const SizedBox(height: 16),
          AnonymousToggle(
            postAnonymously: postAnonymously,
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: 'Contact Methods'),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactMethodsCheckBoxes(
                selectedContactMethods: selectedContactMethods,
              ),
              if (contactMethodsError)
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 6),
                  child: Text(
                    'Please select at least one contact method',
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),
          const SectionTitle(title: 'Photos (Up to 5) Optional'),
          const SizedBox(height: 16),
          PhotoUpload(
            selectedImages: selectedPhotos,
          ),
          const SizedBox(height: 16),
          AppButton(
            onPressed: () {
              if (isButtonEnabled) {
                final isValid = formKey.currentState!.validate();
                final hasContactMethod =
                    selectedContactMethods.value.isNotEmpty;

                setState(() {
                  contactMethodsError = !hasContactMethod;
                });

                if (!isValid || !hasContactMethod) {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                  return;
                }

                context.read<CreatePostCubit>().createPost(
                  userId: SharedPreferencesSingleton.getString('user'),
                  postType: selectedType.value,
                  itemName: itemNameController.text,
                  itemCategory: itemCategoryController.text,
                  itemDescription: itemDescriptionController.text,
                  location: itemLocationController.text,
                  bountyAmount: bountyController.text.isEmpty
                      ? 0.0
                      : double.parse(bountyController.text),
                  postAnonymously: postAnonymously.value,
                  contactMethods: selectedContactMethods.value,
                  photos: selectedPhotos.value,
                );
              }
            },
            child: isLoading
                ? const LoadingButton()
                : Text('Submit Report', style: AppTextStyle.bold20),
          ),
        ],
      ),
    );
  }
}
