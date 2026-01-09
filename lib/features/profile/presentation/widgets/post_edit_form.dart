import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/constants/categories_list.dart';
import 'package:thameen/core/constants/jordan_cities.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/post%20item/presentation/widgets/anonymous_toggle.dart';
import 'package:thameen/features/post%20item/presentation/widgets/bounty_section.dart';
import 'package:thameen/features/post%20item/presentation/widgets/contact_methods_check_boxes.dart';
import 'package:thameen/features/post%20item/presentation/widgets/drop_down_form_button_category.dart';
import 'package:thameen/features/post%20item/presentation/widgets/drop_down_form_button_city.dart';
import 'package:thameen/features/post%20item/presentation/widgets/photo_upload.dart';
import 'package:thameen/features/post%20item/presentation/widgets/report_text_form_field.dart';
import 'package:thameen/features/post%20item/presentation/widgets/report_type_selector.dart';
import 'package:thameen/features/post%20item/presentation/widgets/section_title.dart';
import 'package:thameen/features/profile/presentation/bloc/myreports/my_reports_cubit.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/loading_button.dart';

class PostEditForm extends StatefulWidget {
  const PostEditForm({super.key, required this.post});
  final PostEntity post;
  @override
  State<PostEditForm> createState() => _PostEditFormState();
}

class _PostEditFormState extends State<PostEditForm> {
  final formKey = GlobalKey<FormState>();
  late ValueNotifier<PostType> selectedType;
  late TextEditingController itemNameController;
  late TextEditingController itemCategoryController;
  late TextEditingController itemDescriptionController;
  late TextEditingController itemLocationController;
  late TextEditingController bountyController;
  late ValueNotifier<bool> postAnonymously;
  late AutovalidateMode autovalidateMode;
  late ValueNotifier<List<ContactMethod>> selectedContactMethods =
      ValueNotifier([]);
  late ValueNotifier<List<String>> existingImageUrls;
  late ValueNotifier<List<File>> newImages;

  bool nameTouched = false;
  bool contactMethodsError = false;
  @override
  void initState() {
    selectedType = ValueNotifier(widget.post.postType);
    itemNameController = TextEditingController(text: widget.post.itemName);
    itemDescriptionController = TextEditingController(
      text: widget.post.itemDescription,
    );
    itemCategoryController = TextEditingController(
      text: widget.post.itemCategory,
    );
    itemLocationController = TextEditingController(text: widget.post.location);
    bountyController = TextEditingController(
      text: widget.post.bountyAmount.toString(),
    );
    postAnonymously = ValueNotifier(widget.post.postAnonymously);
    selectedContactMethods.value = widget.post.contactMethods;
    existingImageUrls = ValueNotifier(widget.post.photoUrls);
    newImages = ValueNotifier([]);
    autovalidateMode = AutovalidateMode.disabled;
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

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isButtonEnabled = true;
    var createPostCubit = context.watch<MyReportsCubit>();
    if (createPostCubit.state is UpdateReportLoading) {
      isLoading = true;
      isButtonEnabled = false;
    } else {
      isLoading = false;
      isButtonEnabled = true;
    }
    return Form(
      key: formKey,
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
                  offerBountyEdit: widget.post.bountyAmount > 0,
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
              ValueListenableBuilder<bool>(
                valueListenable: postAnonymously,
                builder: (context, isAnonymous, _) {
                  return ContactMethodsCheckBoxes(
                    selectedContactMethods: selectedContactMethods,
                    isAnonymously: postAnonymously,
                  );
                },
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
            existingImageUrls: existingImageUrls,
            newImages: newImages,
          ),
          const SizedBox(height: 16),
          AppButton(
            onPressed: () async {
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
                if (selectedType.value == PostType.found) {
                  bountyController.text = '';
                }
                final postImages = List<String>.from(existingImageUrls.value);
                if (newImages.value.isNotEmpty) {
                  final newPostImage = await context
                      .read<MyReportsCubit>()
                      .uploadImage(
                        widget.post.id,
                        newImages.value,
                      );
                  postImages.addAll(newPostImage);
                }

                context.read<MyReportsCubit>().editReport(
                  PostEntity(
                    id: widget.post.id,
                    userId: widget.post.userId,
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
                    photoUrls: postImages,
                    createdAt: DateTime.now(),
                    postState: widget.post.postState,
                  ),
                );
              }
            },
            child: isLoading
                ? const LoadingButton()
                : Text('Update Report', style: AppTextStyle.bold20),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
