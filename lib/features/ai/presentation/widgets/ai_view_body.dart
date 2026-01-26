import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/ai/presentation/bloc/ai/ai_cubit.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_view_header.dart';
import 'package:thameen/features/ai/presentation/widgets/photo_upload_section.dart';
import 'package:thameen/features/ai/presentation/widgets/ready_to_search_section.dart';
import 'package:thameen/features/ai/presentation/widgets/search_result_section.dart';
import 'package:thameen/features/home/presentation/widgets/no_reports_found.dart';

class AiViewBody extends StatelessWidget {
  const AiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AiViewHeader(),
          const SizedBox(height: 16),
          const PhotoUploadSection(),
          const SizedBox(height: 16),

          BlocBuilder<AiSearchCubit, AiSearchState>(
            builder: (context, state) {
              if (state is AiSearchInitial) {
                return const ReadyToSearchSection();
              }
              if (state is AiSearchFailure) {
                return const NoReportsFound(isAi: true);
              }

              if (state is AiSearchSuccess) {
                if (state.results.isEmpty) {
                  return const NoReportsFound();
                } else {
                  return SearchResultSection(results: state.results);
                }
              }

              if (state is AiSearchFailure) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
