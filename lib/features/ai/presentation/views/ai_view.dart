import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/ai/presentation/bloc/ai/ai_cubit.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_view_body.dart';
import 'package:thameen/shared/services/ai_service.dart';

class AiView extends StatelessWidget {
  const AiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiSearchCubit(aiService: getIt<AiService>()),
      child: const AiViewBody(),
    );
  }
}
