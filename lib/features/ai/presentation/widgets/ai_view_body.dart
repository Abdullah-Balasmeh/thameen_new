import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_view_header.dart';
import 'package:thameen/features/ai/presentation/widgets/photo_upload_section.dart';
import 'package:thameen/features/ai/presentation/widgets/ready_to_search_section.dart';
import 'package:thameen/features/ai/presentation/widgets/search_result_section.dart';

class AiViewBody extends StatefulWidget {
  const AiViewBody({super.key});

  @override
  State<AiViewBody> createState() => _AiViewBodyState();
}

class _AiViewBodyState extends State<AiViewBody> {
  late ValueNotifier<File?> image;
  bool isSearching = false;
  @override
  void initState() {
    image = ValueNotifier<File?>(null);
    super.initState();
  }

  @override
  void dispose() {
    image.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AiViewHeader(),
          const SizedBox(height: 16),
          PhotoUploadSection(image: image),
          ValueListenableBuilder(
            valueListenable: image,
            builder: (context, file, _) {
              if (file == null) {
                return const Column(
                  children: [
                    SizedBox(height: 16),
                    ReadyToSearchSection(),
                    SizedBox(height: 16),
                  ],
                );
              }
              return isSearching == false
                  ? const SearchResultSection()
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
