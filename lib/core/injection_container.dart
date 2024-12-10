import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app_with_cubit/core/utils/app_url.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_data_source_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/datasource/quiz_remote_datasource.dart';
import 'package:quiz_app_with_cubit/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz_app_with_cubit/features/quiz/domain/usecases/get_quiz_usecase.dart';
import 'package:quiz_app_with_cubit/features/quiz/presentation/cubit/quiz_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  serviceLocator.registerFactory(() => QuizCubit(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetQuizUsecase(serviceLocator()));
  serviceLocator.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImpl(quizRemoteDatasource: serviceLocator()));
  serviceLocator.registerLazySingleton<QuizRemoteDatasource>(
      () => QuizRemoteDataSourceImpl(dio: serviceLocator()));
  serviceLocator.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: AppUrl.baseUrl)));
}
