import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thameen/core/language/language_service.dart';
import 'package:thameen/core/theme/theme_service.dart';
import 'package:thameen/features/auth/data/repositories_impl/auth_repo_impl.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/post%20item/data/repositories_impl/post_repository_impl.dart';
import 'package:thameen/features/post%20item/domain/repositories/post_repository.dart';
import 'package:thameen/shared/services/database_service.dart';
import 'package:thameen/shared/services/firebase_auth_service.dart';
import 'package:thameen/shared/services/firebase_storage.dart';
import 'package:thameen/shared/services/firestore_service.dart';
import 'package:thameen/shared/services/image_picker_service.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await SharedPreferencesSingleton.initInstance();
  getIt.registerLazySingleton(() => LanguageService());
  getIt.registerLazySingleton(() => ThemeService());
  getIt.registerLazySingleton(() => ImagePickerService(ImagePicker()));
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerLazySingleton<DatabaseService>(
    () => FirestoreService(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerLazySingleton(() => FirebaseStorageService());

  getIt.registerSingleton<PostRepository>(
    PostRepositoryImpl(
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
