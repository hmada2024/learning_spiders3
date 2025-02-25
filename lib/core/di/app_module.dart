//lib/core/di/app_module.dart
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:learning_spiders/core/data/database_helper.dart';
import 'package:learning_spiders/core/data/repositories/adjective_repository.dart';
import 'package:learning_spiders/core/data/repositories/compound_word_repository.dart';
import 'package:learning_spiders/core/data/repositories/noun_repository.dart';
import 'package:learning_spiders/core/data/repositories/verb_conjugations_repository.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_adjective/learn_adjective_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_compound_word/learn_compound_word_bloc.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_noun/learn_noun_bloc.dart';
import 'package:learning_spiders/core/services/audio_service.dart';
import 'package:learning_spiders/core/user/user_cubit.dart';
import 'package:learning_spiders/core/theme/theme_cubit.dart';
import 'package:learning_spiders/Learning_section/blocs/learn_verb_conjugation/learn_verb_conjugations_bloc.dart';
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_correct_answer/choose_correct_answer_bloc.dart';
import 'package:flutter/services.dart'; // تأكد من وجود هذا الاستيراد
import 'package:learning_spiders/quizzes_section/nouns/blocs/choose_word_correct/choose_word_correct_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Initialize and register DatabaseHelper
  final dbHelper = await DatabaseHelper.initialize();
  getIt.registerSingleton<DatabaseHelper>(dbHelper);
  // Register AudioService as a Singleton
  getIt.registerLazySingleton<AudioService>(() => AudioService());

  // Register Cubits
  getIt.registerFactory<UserCubit>(() => UserCubit());
  getIt.registerFactory<ThemeCubit>(() => ThemeCubit());

  // Register Repositories (using the DatabaseHelper instance)
  getIt.registerLazySingleton<AdjectiveRepository>(
      () => AdjectiveRepository(getIt<DatabaseHelper>().database));
  getIt.registerLazySingleton<CompoundWordRepository>(
      () => CompoundWordRepository(getIt<DatabaseHelper>().database));
  getIt.registerLazySingleton<NounRepository>(
      () => NounRepository(getIt<DatabaseHelper>().database));
  getIt.registerLazySingleton<VerbConjugationsRepository>(
      () => VerbConjugationsRepository(getIt<DatabaseHelper>().database));

  // Register Blocs (using the Repositories)
  getIt.registerFactory<LearnAdjectiveBloc>(() =>
      LearnAdjectiveBloc(getIt<AdjectiveRepository>(), getIt<AudioService>()));
  getIt.registerFactory<LearnCompoundWordBloc>(() => LearnCompoundWordBloc(
      getIt<CompoundWordRepository>(), getIt<AudioService>()));
  getIt.registerFactory<LearnNounBloc>(
      () => LearnNounBloc(getIt<NounRepository>(), getIt<AudioService>()));
  getIt.registerFactory<LearnVerbConjugationsBloc>(() =>
      LearnVerbConjugationsBloc(
          getIt<VerbConjugationsRepository>(), getIt<AudioService>()));
  getIt.registerLazySingleton<ChooseCorrectAnswerBloc>(
    () =>
        ChooseCorrectAnswerBloc(getIt<NounRepository>(), getIt<AudioService>()),
  );
  getIt.registerFactory<ChooseWordCorrectBloc>(
    () => ChooseWordCorrectBloc(getIt<NounRepository>(), getIt<AudioService>()),
  );

    getIt.registerLazySingleton<AssetBundle>(() => rootBundle);
}