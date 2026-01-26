import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class ImagesContainer extends StatefulWidget {
  const ImagesContainer({
    super.key,
    required this.images,
    required this.chatId,
  });
  final List<File> images;
  final String chatId;
  @override
  State<ImagesContainer> createState() => _ImagesContainerState();
}

class _ImagesContainerState extends State<ImagesContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).selectedImages, style: AppTextStyle.bold24),
            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.images
                  .map(
                    (e) => Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            e,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.images.remove(e);
                                if (widget.images.isEmpty) {
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.close,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 24),

            AppButton(
              onPressed: () {
                context.read<ChatCubit>().sendImages(
                  chatId: widget.chatId,
                  images: widget.images,
                );
                Navigator.pop(context);
              },
              child: Text(S.of(context).sendImages, style: AppTextStyle.bold20),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
