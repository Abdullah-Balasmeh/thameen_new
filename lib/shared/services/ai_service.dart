import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:thameen/core/errors/failure.dart';
import 'package:thameen/features/ai/data/models/ai_match_model.dart';

class AiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080',
      // Android Emulator
      // لو جهاز حقيقي: IP الكمبيوتر
    ),
  );

  Future<Either<Failure, List<AiMatchModel>>> searchByImage(File image) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      final response = await _dio.post(
        '/search_one',
        data: formData,
        queryParameters: {
          'topk': 5,
        },
      );

      final List matches = response.data['matches'] as List;

      return right(
        matches
            .map((e) => AiMatchModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      log('AI Search Failed: $e');
      return left(ServerFailure('AI Search Failed: $e'));
    }
  }
}
